resource "aws_iam_role_policy" "tfer--AWSServiceRoleForConnectCampaigns_V6cyhwKuXSQl6Qctv2Jt_ConnectCampaignsServiceConnectIntegrationAccess" {
  name = "ConnectCampaignsServiceConnectIntegrationAccess"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "connect:StartOutboundVoiceContact",
        "connect:GetMetricData",
        "connect:GetCurrentMetricData",
        "connect:GetCurrentUserData"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:connect:ap-southeast-2:692811742553:instance/33d0b648-39ac-4ef2-b5b2-d6937044b754*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "AWSServiceRoleForConnectCampaigns_V6cyhwKuXSQl6Qctv2Jt"
}

resource "aws_iam_role_policy" "tfer--AWSServiceRoleForLexV2Bots_4ODE19B28CT_AmazonLexServicePolicy-4ODE19B28CT-S3PolicyForS3Download" {
  name = "AmazonLexServicePolicy-4ODE19B28CT-S3PolicyForS3Download"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::wombattestscripts"
      ]
    },
    {
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::wombattestscripts/*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "AWSServiceRoleForLexV2Bots_4ODE19B28CT"
}

resource "aws_iam_role_policy" "tfer--AWSServiceRoleForLexV2Bots_YSZUSAJRFWJ_AmazonLexServicePolicy-YSZUSAJRFWJ-S3PolicyForS3Download" {
  name = "AmazonLexServicePolicy-YSZUSAJRFWJ-S3PolicyForS3Download"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::wombattestscripts"
      ]
    },
    {
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::wombattestscripts/*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "AWSServiceRoleForLexV2Bots_YSZUSAJRFWJ"
}

resource "aws_iam_role_policy" "tfer--wombat-ContactAPIRole-y8QH9O2s27l5_ContactAPIPolicy" {
  name = "ContactAPIPolicy"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sqs:SendMessage",
      "Effect": "Allow",
      "Resource": "arn:aws:sqs:ap-southeast-2:692811742553:contact-queue"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "wombat-ContactAPIRole-y8QH9O2s27l5"
}

resource "aws_iam_role_policy" "tfer--wombat-ContactLambdaExecutionRole-YCZZB2rxbKXw_LambdaSQSDynamoDBPolicy" {
  name = "LambdaSQSDynamoDBPolicy"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "dynamodb:PutItem",
        "dynamodb:GetItem"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:dynamodb:ap-southeast-2:692811742553:table/contact-table"
    },
    {
      "Action": [
        "sqs:ReceiveMessage",
        "sqs:DeleteMessage",
        "sqs:GetQueueAttributes"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:sqs:ap-southeast-2:692811742553:contact-queue"
    },
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:ap-southeast-2:692811742553:log-group:/aws/lambda/*:*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "wombat-ContactLambdaExecutionRole-YCZZB2rxbKXw"
}

resource "aws_iam_role_policy" "tfer--wombat-DynamoDBAPILambdaExecutionRole-kkYdpdQqPNbl_DynamoDBReadOnly" {
  name = "DynamoDBReadOnly"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "dynamodb:Query"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:dynamodb:ap-southeast-2:692811742553:table/contact-table",
        "arn:aws:dynamodb:ap-southeast-2:692811742553:table/contact-table/index/CampaignIndex"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "wombat-DynamoDBAPILambdaExecutionRole-kkYdpdQqPNbl"
}

resource "aws_iam_role_policy" "tfer--wombat-DynamoDBAPIRole-oLIqFnr99yrP_DynamoDBAPIPolicy" {
  name = "DynamoDBAPIPolicy"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "lambda:InvokeFunction"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:lambda:ap-southeast-2:692811742553:function:wombat-DynamoDBAPILambdaFunction-SZL0bE0WNpt6"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "wombat-DynamoDBAPIRole-oLIqFnr99yrP"
}
