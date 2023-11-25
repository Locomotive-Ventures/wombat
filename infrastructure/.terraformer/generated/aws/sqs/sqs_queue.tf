resource "aws_sqs_queue" "tfer--contact-queue" {
  content_based_deduplication       = "false"
  delay_seconds                     = "0"
  fifo_queue                        = "false"
  kms_data_key_reuse_period_seconds = "300"
  max_message_size                  = "262144"
  message_retention_seconds         = "345600"
  name                              = "contact-queue"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sqs:SendMessage",
      "Effect": "Allow",
      "Principal": {
        "Service": "apigateway.amazonaws.com"
      },
      "Resource": "arn:aws:sqs:ap-southeast-2:692811742553:ContactQueue"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  receive_wait_time_seconds  = "0"
  sqs_managed_sse_enabled    = "true"
  visibility_timeout_seconds = "30"
}
