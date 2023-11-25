resource "aws_organizations_organization" "tfer--Wombat-0020-AI" {
  aws_service_access_principals = ["access-analyzer.amazonaws.com", "sso.amazonaws.com"]
  feature_set                   = "ALL"
}
