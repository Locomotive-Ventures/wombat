resource "aws_cloudformation_stack" "tfer--wombat" {
  capabilities       = ["CAPABILITY_IAM"]
  disable_rollback   = "false"
  name               = "wombat"
  template_body      = "AWSTemplateFormatVersion: '2010-09-09'\nDescription: Testing resourses excluding the Caller part\n\nParameters:\n  QueueName:\n    Type: String\n    Description: The name of the SQS queue\n    Default: contact-queue\n\nResources:\n  WebsiteBucket:\n    Type: AWS::S3::Bucket\n    Properties:\n      WebsiteConfiguration:\n        IndexDocument: index.html\n\n  WebsiteBucketPolicy:\n    Type: AWS::S3::BucketPolicy\n    Properties:\n      Bucket: !Ref WebsiteBucket\n      PolicyDocument:\n        Statement:\n        - Action: s3:GetObject\n          Effect: Allow\n          Resource: !Sub ${WebsiteBucket.Arn}/*\n          Principal:\n            Service: cloudfront.amazonaws.com\n          Condition:\n            StringEquals:\n              AWS:SourceArn: !Sub arn:aws:cloudfront::$${AWS::AccountId}:distribution/$${CloudFrontDistribution}\n\n# CloudFront setup\n\n  CloudFrontDistribution:\n    Type: AWS::CloudFront::Distribution\n    Properties:\n      DistributionConfig:\n        Origins:\n          - Id: myS3Origin\n            DomainName: !GetAtt [WebsiteBucket, DomainName]\n            S3OriginConfig:\n              OriginAccessIdentity: ''\n            OriginAccessControlId: !GetAtt CloudFrontOriginAccessControl.Id\n        Enabled: true\n        DefaultCacheBehavior:\n          TargetOriginId: myS3Origin\n          ViewerProtocolPolicy: redirect-to-https\n          ForwardedValues:\n            QueryString: false\n            Cookies:\n              Forward: none\n        DefaultRootObject: index.html\n\n  CloudFrontOriginAccessControl:\n    Type: AWS::CloudFront::OriginAccessControl\n    Properties:\n      OriginAccessControlConfig:\n        Description: Default Origin Access Control\n        Name: !Ref AWS::StackName\n        OriginAccessControlOriginType: s3\n        SigningBehavior: always\n        SigningProtocol: sigv4\n\n# SQS Setup\n\n  ContactQueue:\n    Type: AWS::SQS::Queue\n    Properties:\n      QueueName: !Ref QueueName\n\n  ContactQueuePolicy:\n    Type: AWS::SQS::QueuePolicy\n    Properties:\n      Queues:\n        - Ref: ContactQueue\n      PolicyDocument:\n        Version: '2012-10-17'\n        Statement:\n          - Effect: Allow\n            Principal:\n              Service: apigateway.amazonaws.com\n            Action:\n              - sqs:SendMessage\n            Resource:\n              Fn::Sub: arn:aws:sqs:$${AWS::Region}:$${AWS::AccountId}:ContactQueue\n\n# DynamoDB table setup\n\n  ContactTable:\n    Type: AWS::DynamoDB::Table\n    Properties:\n      TableName: 'contact-table'\n      AttributeDefinitions:\n        - AttributeName: uniqueId\n          AttributeType: S\n        - AttributeName: campaignId\n          AttributeType: S\n      KeySchema:\n        - AttributeName: uniqueId\n          KeyType: HASH\n      ProvisionedThroughput:\n        ReadCapacityUnits: 1\n        WriteCapacityUnits: 1\n      GlobalSecondaryIndexes:\n        - IndexName: CampaignIndex\n          KeySchema:\n            - AttributeName: campaignId\n              KeyType: HASH\n          Projection:\n            ProjectionType: ALL\n          ProvisionedThroughput:\n            ReadCapacityUnits: 1\n            WriteCapacityUnits: 1\n\n# Lambda to pick up records from the SQS and add them to Dynamo\n\n  ContactLambdaLogGroup:\n    Type: AWS::Logs::LogGroup\n    Properties:\n      LogGroupName: !Sub /aws/lambda/$${ContactLambda}\n      RetentionInDays: 7\n\n  ContactLambda:\n    Type: AWS::Lambda::Function\n    Properties:\n      Handler: index.handler\n      Role: !GetAtt ContactLambdaExecutionRole.Arn\n      Runtime: python3.11\n      Code:\n        ZipFile: |\n          import boto3\n          import json\n          import os\n          dynamodb = boto3.resource('dynamodb')\n          def handler(event, context):\n              table_name = os.environ['TABLE_NAME']\n              table = dynamodb.Table(table_name)\n              for record in event['Records']:\n                  message_body = json.loads(record['body'])\n                  response = table.put_item(Item=message_body)\n              return {\n                  'statusCode': 200,\n                  'body': json.dumps('Messages processed and stored in DynamoDB')\n              }\n      Environment:\n        Variables:\n          QUEUE_URL: !Ref ContactQueue\n          TABLE_NAME: !Ref ContactTable\n\n  ContactLambdaExecutionRole:\n    Type: AWS::IAM::Role\n    Properties:\n      AssumeRolePolicyDocument:\n        Version: '2012-10-17'\n        Statement:\n          - Effect: Allow\n            Principal:\n              Service: lambda.amazonaws.com\n            Action: sts:AssumeRole\n      Policies:\n        - PolicyName: LambdaSQSDynamoDBPolicy\n          PolicyDocument:\n            Version: '2012-10-17'\n            Statement:\n              - Effect: Allow\n                Action:\n                  - dynamodb:PutItem\n                  - dynamodb:GetItem\n                Resource: !GetAtt ContactTable.Arn\n              - Effect: Allow\n                Action:\n                  - sqs:ReceiveMessage\n                  - sqs:DeleteMessage\n                  - sqs:GetQueueAttributes\n                Resource: !GetAtt ContactQueue.Arn\n              - Effect: Allow\n                Action:\n                  - logs:CreateLogGroup\n                  - logs:CreateLogStream\n                  - logs:PutLogEvents\n                Resource:\n                  - !Sub arn:aws:logs:$${AWS::Region}:$${AWS::AccountId}:log-group:/aws/lambda/*:*\n\n  ContactLambdaEventSourceMapping:\n    Type: AWS::Lambda::EventSourceMapping\n    Properties:\n      EventSourceArn: !GetAtt ContactQueue.Arn\n      FunctionName: !GetAtt ContactLambda.Arn\n      Enabled: true\n      BatchSize: 1\n\n# API to trigger SQS from CloudFront\n\n  ContactAPI:\n    Type: 'AWS::ApiGateway::RestApi'\n    Properties:\n      Name: 'ContactAPI'\n\n  ContactAPIResource:\n    Type: 'AWS::ApiGateway::Resource'\n    Properties:\n      RestApiId:\n        Ref: 'ContactAPI'\n      ParentId:\n        Fn::GetAtt:\n          - 'ContactAPI'\n          - 'RootResourceId'\n      PathPart: 'message'\n\n  ContactAPIOptionsMethod:\n    Type: 'AWS::ApiGateway::Method'\n    Properties:\n      RestApiId:\n        Ref: 'ContactAPI'\n      ResourceId:\n        Ref: 'ContactAPIResource'\n      HttpMethod: 'OPTIONS'\n      AuthorizationType: 'NONE'\n      Integration:\n        Type: 'MOCK'\n        RequestTemplates:\n          application/json: '{\"statusCode\": 200}'\n        IntegrationResponses:\n          - StatusCode: 200\n            ResponseParameters:\n              method.response.header.Access-Control-Allow-Headers: \"'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'\"\n              method.response.header.Access-Control-Allow-Methods: \"'GET, POST, OPTIONS'\"\n              method.response.header.Access-Control-Allow-Origin: \"'*'\"\n            ResponseTemplates:\n              application/json: ''\n      MethodResponses:\n        - StatusCode: 200\n          ResponseModels:\n            application/json: \"Empty\"\n          ResponseParameters:\n            method.response.header.Access-Control-Allow-Headers: true\n            method.response.header.Access-Control-Allow-Methods: true\n            method.response.header.Access-Control-Allow-Origin: true\n\n  ContactAPIMethod:\n    Type: 'AWS::ApiGateway::Method'\n    Properties:\n      RestApiId:\n        Ref: 'ContactAPI'\n      ResourceId:\n        Ref: 'ContactAPIResource'\n      HttpMethod: 'POST'\n      AuthorizationType: 'NONE'\n      Integration:\n        Type: 'AWS'\n        IntegrationHttpMethod: 'POST'\n        Uri: !Sub 'arn:aws:apigateway:$${AWS::Region}:sqs:path/$${AWS::AccountId}/$${QueueName}'\n        Credentials: !GetAtt 'ContactAPIRole.Arn'\n        RequestParameters:\n          'integration.request.header.Content-Type': \"'application/x-www-form-urlencoded'\"\n        RequestTemplates:\n          'application/json': !Sub |\n            Action=SendMessage\u0026MessageBody=$util.urlEncode(\"$input.body\")\n        IntegrationResponses:\n          - StatusCode: 200\n            ResponseTemplates:\n              application/json: '{\"statusCode\": 200}'\n      MethodResponses:\n        - StatusCode: 200\n          ResponseModels:\n            application/json: \"Empty\"\n\n  ContactAPIDeployment:\n    Type: AWS::ApiGateway::Deployment\n    Properties:\n      RestApiId:\n        Ref: ContactAPI\n    DependsOn:\n      - ContactAPIMethod\n      - ContactAPIOptionsMethod\n\n  MyStage:\n    Type: AWS::ApiGateway::Stage\n    Properties:\n      StageName: \"Prod\"\n      Description: \"Production Stage\"\n      RestApiId:\n        Ref: ContactAPI\n      DeploymentId:\n        Ref: ContactAPIDeployment\n\n  ContactAPIRole:\n    Type: 'AWS::IAM::Role'\n    Properties:\n      AssumeRolePolicyDocument:\n        Version: '2012-10-17'\n        Statement:\n          - Effect: 'Allow'\n            Principal:\n              Service: 'apigateway.amazonaws.com'\n            Action: 'sts:AssumeRole'\n      Policies:\n        - PolicyName: 'ContactAPIPolicy'\n          PolicyDocument:\n            Version: '2012-10-17'\n            Statement:\n              - Effect: 'Allow'\n                Action: 'sqs:SendMessage'\n                Resource:\n                  Fn::GetAtt: 'ContactQueue.Arn'\n\n# Lambda to query DynamoDB\n\n  DynamoDBAPILambdaExecutionRole:\n    Type: AWS::IAM::Role\n    Properties:\n      AssumeRolePolicyDocument:\n        Version: '2012-10-17'\n        Statement:\n          - Effect: Allow\n            Principal:\n              Service: lambda.amazonaws.com\n            Action: sts:AssumeRole\n      Policies:\n        - PolicyName: DynamoDBReadOnly\n          PolicyDocument:\n            Version: '2012-10-17'\n            Statement:\n              - Effect: Allow\n                Action:\n                  - 'dynamodb:Query'\n                Resource:\n                  - !GetAtt ContactTable.Arn\n                  - !Sub \"${ContactTable.Arn}/index/CampaignIndex\"\n\n  DynamoDBAPILambdaFunction:\n    Type: AWS::Lambda::Function\n    Properties:\n      Handler: index.handler\n      Role: !GetAtt DynamoDBAPILambdaExecutionRole.Arn\n      Code:\n        ZipFile: |\n          import json\n          import boto3\n          import os\n          dynamodb = boto3.client('dynamodb')\n          table_name = os.environ['TABLE_NAME']\n          def handler(event, context):\n              campaign_id = event['queryStringParameters']['campaignId']\n              response = dynamodb.query(\n                  TableName=table_name,\n                  IndexName='CampaignIndex',\n                  KeyConditionExpression='campaignId = :v1',\n                  ExpressionAttributeValues={\n                      ':v1': {'S': campaign_id}\n                  }\n              )\n              items = response.get('Items', [])\n              formatted_items = [{k: v['S'] for k, v in item.items()} for item in items]\n              return {\n                  'statusCode': 200,\n                  'headers': {\n                      'Access-Control-Allow-Headers': 'Content-Type',\n                      'Access-Control-Allow-Origin': '*',\n                      'Access-Control-Allow-Methods': 'OPTIONS,POST,GET'\n                  },\n                  'body': json.dumps(formatted_items)\n              }\n      Environment:\n        Variables:\n          TABLE_NAME: !Ref ContactTable\n      Runtime: python3.11\n      Timeout: 10\n\n  DynamoDBAPILambdaLogGroup:\n    Type: AWS::Logs::LogGroup\n    Properties:\n      LogGroupName: !Sub /aws/lambda/$${DynamoDBAPILambdaFunction}\n      RetentionInDays: 7\n\n# API to query trigger Lambda to query data from Dynamo\n\n  DynamoDBAPI:\n    Type: AWS::ApiGateway::RestApi\n    Properties:\n      Name: DynamoDBAPI\n\n  DynamoDBAPIResource:\n    Type: AWS::ApiGateway::Resource\n    Properties:\n      RestApiId: !Ref DynamoDBAPI\n      ParentId: !GetAtt DynamoDBAPI.RootResourceId\n      PathPart: 'data'\n\n  DynamoDBAPIRole:\n    Type: 'AWS::IAM::Role'\n    Properties:\n      AssumeRolePolicyDocument:\n        Version: '2012-10-17'\n        Statement:\n          - Effect: 'Allow'\n            Principal:\n              Service: 'apigateway.amazonaws.com'\n            Action: 'sts:AssumeRole'\n      Policies:\n        - PolicyName: 'DynamoDBAPIPolicy'\n          PolicyDocument:\n            Version: '2012-10-17'\n            Statement:\n              - Effect: 'Allow'\n                Action:\n                  - 'lambda:InvokeFunction' # Add this permission to allow API Gateway to invoke Lambda functions\n                Resource:\n                  - !GetAtt DynamoDBAPILambdaFunction.Arn\n\n  DynamoDBAPIMethod:\n    Type: AWS::ApiGateway::Method\n    Properties:\n      RestApiId: !Ref DynamoDBAPI\n      ResourceId: !Ref DynamoDBAPIResource\n      HttpMethod: 'GET'\n      AuthorizationType: 'NONE'\n      Integration:\n        Type: 'AWS_PROXY'\n        Uri: !Sub 'arn:aws:apigateway:$${AWS::Region}:lambda:path/2015-03-31/functions/${DynamoDBAPILambdaFunction.Arn}/invocations'\n        Credentials: !GetAtt DynamoDBAPIRole.Arn\n        IntegrationHttpMethod: 'POST'\n        RequestParameters:\n          'integration.request.header.Content-Type': \"'application/x-www-form-urlencoded'\"\n        RequestTemplates:\n          'application/json': !Sub |\n            Action=SendMessage\u0026MessageBody=$util.urlEncode(\"$input.body\")\n      MethodResponses:\n        - StatusCode: 200\n          ResponseModels:\n            application/json: \"Empty\"\n          ResponseParameters:\n            method.response.header.Access-Control-Allow-Headers: true\n            method.response.header.Access-Control-Allow-Methods: true\n            method.response.header.Access-Control-Allow-Origin: true\n            method.response.header.Access-Control-Allow-Credentials: true\n\n  DynamoDBAPIDeployment:\n    Type: AWS::ApiGateway::Deployment\n    Properties:\n      RestApiId: !Ref DynamoDBAPI\n      Description: 'API Deployment'\n    DependsOn: DynamoDBAPIMethod\n\n  DynamoDBAPIStage:\n    Type: AWS::ApiGateway::Stage\n    Properties:\n      StageName: 'Prod'\n      RestApiId: !Ref DynamoDBAPI\n      DeploymentId: !Ref DynamoDBAPIDeployment\n\nOutputs:\n  ContactAPIInvokeURL:\n    Description: 'Invoke URL of ContactAPI'\n    Value:\n      Fn::Sub: 'https://$${ContactAPI}.execute-api.$${AWS::Region}.amazonaws.com/Prod/message'\n  DynamoDBAPIInvokeURL:\n    Description: 'Invoke URL of DynamoDBAPI'\n    Value:\n      Fn::Sub: 'https://$${DynamoDBAPI}.execute-api.$${AWS::Region}.amazonaws.com/Prod/message'\n  WebsiteURL:\n    Value: !Sub \"https://${CloudFrontDistribution.DomainName}\"\n  BucketName:\n    Value: !Ref WebsiteBucket\n"
  timeout_in_minutes = "0"
}