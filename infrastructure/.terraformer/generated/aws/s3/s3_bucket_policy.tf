resource "aws_s3_bucket_policy" "tfer--wombat-websitebucket-2csjalc5ms6v" {
  bucket = "wombat-websitebucket-2csjalc5ms6v"
  policy = "{\"Statement\":[{\"Action\":\"s3:GetObject\",\"Condition\":{\"StringEquals\":{\"AWS:SourceArn\":\"arn:aws:cloudfront::692811742553:distribution/E13BOF66B7QH22\"}},\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"cloudfront.amazonaws.com\"},\"Resource\":\"arn:aws:s3:::wombat-websitebucket-2csjalc5ms6v/*\"}],\"Version\":\"2008-10-17\"}"
}
