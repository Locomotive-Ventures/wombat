resource "aws_cloudwatch_event_rule" "tfer--ConnectCampaignsRule-33d0b648-39ac-4ef2-b5b2-d6937044b754" {
  description    = "This rule is used to route Amazon Connect Contact Events to Connect Campaigns. Deleting this rule will cause Connect Campaigns to stop working."
  event_bus_name = "default"
  event_pattern  = "{\"detail-type\":[\"Amazon Connect Contact Event\"],\"resources\":[\"arn:aws:connect:ap-southeast-2:692811742553:instance/33d0b648-39ac-4ef2-b5b2-d6937044b754\"],\"source\":[\"aws.connect\"]}"
  is_enabled     = "true"
  name           = "ConnectCampaignsRule-33d0b648-39ac-4ef2-b5b2-d6937044b754"
}
