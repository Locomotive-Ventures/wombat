resource "aws_iam_role_policy_attachment" "tfer--AWSReservedSSO_Administrator_7b99023c74d791a9_AdministratorAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = "AWSReservedSSO_Administrator_7b99023c74d791a9"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSReservedSSO_PowerUserAccess_efe9939cc8e501d7_PowerUserAccess" {
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
  role       = "AWSReservedSSO_PowerUserAccess_efe9939cc8e501d7"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSReservedSSO_ReadOnlyAccess_fd3eb65163305a49_ReadOnlyAccess" {
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  role       = "AWSReservedSSO_ReadOnlyAccess_fd3eb65163305a49"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForAPIGateway_APIGatewayServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/APIGatewayServiceRolePolicy"
  role       = "AWSServiceRoleForAPIGateway"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForAccessAnalyzer_AccessAnalyzerServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AccessAnalyzerServiceRolePolicy"
  role       = "AWSServiceRoleForAccessAnalyzer"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForApplicationAutoScaling_DynamoDBTable_AWSApplicationAutoscalingDynamoDBTablePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSApplicationAutoscalingDynamoDBTablePolicy"
  role       = "AWSServiceRoleForApplicationAutoScaling_DynamoDBTable"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForConnectCampaigns_V6cyhwKuXSQl6Qctv2Jt_AmazonConnectCampaignsServiceLinkedRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonConnectCampaignsServiceLinkedRolePolicy"
  role       = "AWSServiceRoleForConnectCampaigns_V6cyhwKuXSQl6Qctv2Jt"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForLexV2Bots_4ODE19B28CT_AmazonLexV2BotPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonLexV2BotPolicy"
  role       = "AWSServiceRoleForLexV2Bots_4ODE19B28CT"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForLexV2Bots_EGD6JFG2V28_AmazonLexV2BotPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonLexV2BotPolicy"
  role       = "AWSServiceRoleForLexV2Bots_EGD6JFG2V28"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForLexV2Bots_HO7H7Q3KCOE_AmazonLexV2BotPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonLexV2BotPolicy"
  role       = "AWSServiceRoleForLexV2Bots_HO7H7Q3KCOE"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForLexV2Bots_YSZUSAJRFWJ_AmazonLexV2BotPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonLexV2BotPolicy"
  role       = "AWSServiceRoleForLexV2Bots_YSZUSAJRFWJ"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForOrganizations_AWSOrganizationsServiceTrustPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSOrganizationsServiceTrustPolicy"
  role       = "AWSServiceRoleForOrganizations"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForSSO_AWSSSOServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSSSOServiceRolePolicy"
  role       = "AWSServiceRoleForSSO"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForSupport_AWSSupportServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSSupportServiceRolePolicy"
  role       = "AWSServiceRoleForSupport"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForTrustedAdvisor_AWSTrustedAdvisorServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSTrustedAdvisorServiceRolePolicy"
  role       = "AWSServiceRoleForTrustedAdvisor"
}

resource "aws_iam_role_policy_attachment" "tfer--Administrator_Role_AdministratorAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = "Administrator_Role"
}

resource "aws_iam_role_policy_attachment" "tfer--terraform_apply_AWSLambda_FullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
  role       = "terraform_apply"
}

resource "aws_iam_role_policy_attachment" "tfer--terraform_apply_AmazonAPIGatewayAdministrator" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator"
  role       = "terraform_apply"
}

resource "aws_iam_role_policy_attachment" "tfer--terraform_apply_AmazonDynamoDBFullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  role       = "terraform_apply"
}

resource "aws_iam_role_policy_attachment" "tfer--terraform_apply_AmazonS3FullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = "terraform_apply"
}

resource "aws_iam_role_policy_attachment" "tfer--terraform_apply_AmazonSESFullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSESFullAccess"
  role       = "terraform_apply"
}

resource "aws_iam_role_policy_attachment" "tfer--terraform_apply_AmazonSQSFullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
  role       = "terraform_apply"
}

resource "aws_iam_role_policy_attachment" "tfer--terraform_apply_CloudFrontFullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/CloudFrontFullAccess"
  role       = "terraform_apply"
}

resource "aws_iam_role_policy_attachment" "tfer--terraform_apply_CloudWatchEventsFullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchEventsFullAccess"
  role       = "terraform_apply"
}

resource "aws_iam_role_policy_attachment" "tfer--terraform_plan_AWSLambda_ReadOnlyAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AWSLambda_ReadOnlyAccess"
  role       = "terraform_plan"
}

resource "aws_iam_role_policy_attachment" "tfer--terraform_plan_AmazonAPIGatewayAdministrator" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator"
  role       = "terraform_plan"
}

resource "aws_iam_role_policy_attachment" "tfer--terraform_plan_AmazonDynamoDBReadOnlyAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBReadOnlyAccess"
  role       = "terraform_plan"
}

resource "aws_iam_role_policy_attachment" "tfer--terraform_plan_AmazonS3ReadOnlyAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  role       = "terraform_plan"
}

resource "aws_iam_role_policy_attachment" "tfer--terraform_plan_AmazonSESReadOnlyAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSESReadOnlyAccess"
  role       = "terraform_plan"
}

resource "aws_iam_role_policy_attachment" "tfer--terraform_plan_AmazonSQSReadOnlyAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSQSReadOnlyAccess"
  role       = "terraform_plan"
}

resource "aws_iam_role_policy_attachment" "tfer--terraform_plan_CloudFrontReadOnlyAccess" {
  policy_arn = "arn:aws:iam::aws:policy/CloudFrontReadOnlyAccess"
  role       = "terraform_plan"
}
