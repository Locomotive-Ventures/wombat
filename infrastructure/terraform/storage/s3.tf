resource "aws_s3_bucket" "s3_bucket_static_website" {
  bucket = "wombat-warden-s3-static-website"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_website_configuration" "s3_website_config" {
  bucket = aws_s3_bucket.s3_bucket_static_website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = aws_s3_bucket.s3_bucket_static_website.id

  #TODO: Update role/principal, used dummy values to get TF working
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::123456789012:root"  // Replace with your AWS account ID
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::wombat-warden-s3-static-website/*"
    }
  ]
}
POLICY
}
