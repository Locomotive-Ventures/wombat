resource "aws_organizations_policy" "tfer--FullAWSAccess" {
  content     = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Effect\": \"Allow\",\n      \"Action\": \"*\",\n      \"Resource\": \"*\"\n    }\n  ]\n}"
  description = "Allows access to every operation"
  name        = "FullAWSAccess"
  type        = "SERVICE_CONTROL_POLICY"
}
