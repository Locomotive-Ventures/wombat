resource "aws_cloudwatch_event_target" "tfer--ConnectCampaignsRule-33d0b648-39ac-4ef2-b5b2-d6937044b754-002F-connect-campaigns-target-id" {
  arn       = "arn:aws:connect-campaigns:ap-southeast-2:::"
  rule      = "ConnectCampaignsRule-33d0b648-39ac-4ef2-b5b2-d6937044b754"
  target_id = "connect-campaigns-target-id"
}
