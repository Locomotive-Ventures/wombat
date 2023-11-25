resource "aws_iam_role" "tfer--AWSReservedSSO_Administrator_7b99023c74d791a9" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "sts:AssumeRoleWithSAML",
        "sts:TagSession"
      ],
      "Condition": {
        "StringEquals": {
          "SAML:aud": "https://signin.aws.amazon.com/saml"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::692811742553:saml-provider/AWSSSO_498e5f5047a5fa9d_DO_NOT_DELETE"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  max_session_duration = "43200"
  name                 = "AWSReservedSSO_Administrator_7b99023c74d791a9"
  path                 = "/aws-reserved/sso.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSReservedSSO_PowerUserAccess_efe9939cc8e501d7" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "sts:AssumeRoleWithSAML",
        "sts:TagSession"
      ],
      "Condition": {
        "StringEquals": {
          "SAML:aud": "https://signin.aws.amazon.com/saml"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::692811742553:saml-provider/AWSSSO_498e5f5047a5fa9d_DO_NOT_DELETE"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::aws:policy/PowerUserAccess"]
  max_session_duration = "43200"
  name                 = "AWSReservedSSO_PowerUserAccess_efe9939cc8e501d7"
  path                 = "/aws-reserved/sso.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSReservedSSO_ReadOnlyAccess_fd3eb65163305a49" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "sts:AssumeRoleWithSAML",
        "sts:TagSession"
      ],
      "Condition": {
        "StringEquals": {
          "SAML:aud": "https://signin.aws.amazon.com/saml"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::692811742553:saml-provider/AWSSSO_498e5f5047a5fa9d_DO_NOT_DELETE"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  max_session_duration = "43200"
  name                 = "AWSReservedSSO_ReadOnlyAccess_fd3eb65163305a49"
  path                 = "/aws-reserved/sso.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForAPIGateway" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ops.apigateway.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "The Service Linked Role is used by Amazon API Gateway."
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/APIGatewayServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForAPIGateway"
  path                 = "/aws-service-role/ops.apigateway.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForAccessAnalyzer" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "access-analyzer.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AccessAnalyzerServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForAccessAnalyzer"
  path                 = "/aws-service-role/access-analyzer.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForApplicationAutoScaling_DynamoDBTable" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "dynamodb.application-autoscaling.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSApplicationAutoscalingDynamoDBTablePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForApplicationAutoScaling_DynamoDBTable"
  path                 = "/aws-service-role/dynamodb.application-autoscaling.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForConnectCampaigns_V6cyhwKuXSQl6Qctv2Jt" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "connect-campaigns.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description = "Enables access to AWS Services and Resources used or managed by Amazon Connect Campaigns."

  inline_policy {
    name   = "ConnectCampaignsServiceConnectIntegrationAccess"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"connect:StartOutboundVoiceContact\",\"connect:GetMetricData\",\"connect:GetCurrentMetricData\",\"connect:GetCurrentUserData\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:connect:ap-southeast-2:692811742553:instance/33d0b648-39ac-4ef2-b5b2-d6937044b754*\"}]}"
  }

  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AmazonConnectCampaignsServiceLinkedRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForConnectCampaigns_V6cyhwKuXSQl6Qctv2Jt"
  path                 = "/aws-service-role/connect-campaigns.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForLexV2Bots_4ODE19B28CT" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "lexv2.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  inline_policy {
    name   = "AmazonLexServicePolicy-4ODE19B28CT-S3PolicyForS3Download"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:ListBucket\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::wombattestscripts\"]},{\"Action\":[\"s3:GetObject\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::wombattestscripts/*\"]}]}"
  }

  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AmazonLexV2BotPolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForLexV2Bots_4ODE19B28CT"
  path                 = "/aws-service-role/lexv2.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForLexV2Bots_EGD6JFG2V28" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "lexv2.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AmazonLexV2BotPolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForLexV2Bots_EGD6JFG2V28"
  path                 = "/aws-service-role/lexv2.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForLexV2Bots_HO7H7Q3KCOE" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "lexv2.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AmazonLexV2BotPolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForLexV2Bots_HO7H7Q3KCOE"
  path                 = "/aws-service-role/lexv2.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForLexV2Bots_YSZUSAJRFWJ" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "lexv2.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  inline_policy {
    name   = "AmazonLexServicePolicy-YSZUSAJRFWJ-S3PolicyForS3Download"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:ListBucket\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::wombattestscripts\"]},{\"Action\":[\"s3:GetObject\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::wombattestscripts/*\"]}]}"
  }

  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AmazonLexV2BotPolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForLexV2Bots_YSZUSAJRFWJ"
  path                 = "/aws-service-role/lexv2.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForOrganizations" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "organizations.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Service-linked role used by AWS Organizations to enable integration of other AWS services with Organizations."
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSOrganizationsServiceTrustPolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForOrganizations"
  path                 = "/aws-service-role/organizations.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForSSO" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "sso.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Service-linked role used by AWS SSO to manage AWS resources, including IAM roles, policies and SAML IdP on your behalf."
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSSSOServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForSSO"
  path                 = "/aws-service-role/sso.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForSupport" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "support.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Enables resource access for AWS to provide billing, administrative and support services"
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSSupportServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForSupport"
  path                 = "/aws-service-role/support.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForTrustedAdvisor" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "trustedadvisor.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Access for the AWS Trusted Advisor Service to help reduce cost, increase performance, and improve security of your AWS environment."
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSTrustedAdvisorServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForTrustedAdvisor"
  path                 = "/aws-service-role/trustedadvisor.amazonaws.com/"
}

resource "aws_iam_role" "tfer--Administrator_Role" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Condition": {
        "Bool": {
          "aws:MultiFactorAuthPresent": "true"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::692811742553:root"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  max_session_duration = "3600"
  name                 = "Administrator_Role"
  path                 = "/"
}

resource "aws_iam_role" "tfer--terraform_apply" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "token.actions.githubusercontent.com:aud": "sts.amazonaws.com",
          "token.actions.githubusercontent.com:sub": "repo:Locomotive-Ventures/wombat:ref:refs/heads/main"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::692811742553:oidc-provider/token.actions.githubusercontent.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "This machine role provides full elevated access in order to build the required AWS resources. "
  managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSLambda_FullAccess", "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator", "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess", "arn:aws:iam::aws:policy/AmazonS3FullAccess", "arn:aws:iam::aws:policy/AmazonSESFullAccess", "arn:aws:iam::aws:policy/AmazonSQSFullAccess", "arn:aws:iam::aws:policy/CloudFrontFullAccess", "arn:aws:iam::aws:policy/CloudWatchEventsFullAccess"]
  max_session_duration = "3600"
  name                 = "terraform_apply"
  path                 = "/"
}

resource "aws_iam_role" "tfer--terraform_plan" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "token.actions.githubusercontent.com:aud": "sts.amazonaws.com",
          "token.actions.githubusercontent.com:sub": "repo:Locomotive-Ventures/wombat:*"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::692811742553:oidc-provider/token.actions.githubusercontent.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Read only role to run terraform plan against. "
  managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSLambda_ReadOnlyAccess", "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator", "arn:aws:iam::aws:policy/AmazonDynamoDBReadOnlyAccess", "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess", "arn:aws:iam::aws:policy/AmazonSESReadOnlyAccess", "arn:aws:iam::aws:policy/AmazonSQSReadOnlyAccess", "arn:aws:iam::aws:policy/CloudFrontReadOnlyAccess"]
  max_session_duration = "3600"
  name                 = "terraform_plan"
  path                 = "/"
}

resource "aws_iam_role" "tfer--wombat-ContactAPIRole-y8QH9O2s27l5" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "apigateway.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  inline_policy {
    name   = "ContactAPIPolicy"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"sqs:SendMessage\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:sqs:ap-southeast-2:692811742553:contact-queue\"}]}"
  }

  max_session_duration = "3600"
  name                 = "wombat-ContactAPIRole-y8QH9O2s27l5"
  path                 = "/"
}

resource "aws_iam_role" "tfer--wombat-ContactLambdaExecutionRole-YCZZB2rxbKXw" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  inline_policy {
    name   = "LambdaSQSDynamoDBPolicy"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"dynamodb:PutItem\",\"dynamodb:GetItem\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:dynamodb:ap-southeast-2:692811742553:table/contact-table\"},{\"Action\":[\"sqs:ReceiveMessage\",\"sqs:DeleteMessage\",\"sqs:GetQueueAttributes\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:sqs:ap-southeast-2:692811742553:contact-queue\"},{\"Action\":[\"logs:CreateLogGroup\",\"logs:CreateLogStream\",\"logs:PutLogEvents\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:logs:ap-southeast-2:692811742553:log-group:/aws/lambda/*:*\"]}]}"
  }

  max_session_duration = "3600"
  name                 = "wombat-ContactLambdaExecutionRole-YCZZB2rxbKXw"
  path                 = "/"
}

resource "aws_iam_role" "tfer--wombat-DynamoDBAPILambdaExecutionRole-kkYdpdQqPNbl" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  inline_policy {
    name   = "DynamoDBReadOnly"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"dynamodb:Query\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:dynamodb:ap-southeast-2:692811742553:table/contact-table\",\"arn:aws:dynamodb:ap-southeast-2:692811742553:table/contact-table/index/CampaignIndex\"]}]}"
  }

  max_session_duration = "3600"
  name                 = "wombat-DynamoDBAPILambdaExecutionRole-kkYdpdQqPNbl"
  path                 = "/"
}

resource "aws_iam_role" "tfer--wombat-DynamoDBAPIRole-oLIqFnr99yrP" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "apigateway.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  inline_policy {
    name   = "DynamoDBAPIPolicy"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"lambda:InvokeFunction\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:lambda:ap-southeast-2:692811742553:function:wombat-DynamoDBAPILambdaFunction-SZL0bE0WNpt6\"]}]}"
  }

  max_session_duration = "3600"
  name                 = "wombat-DynamoDBAPIRole-oLIqFnr99yrP"
  path                 = "/"
}
