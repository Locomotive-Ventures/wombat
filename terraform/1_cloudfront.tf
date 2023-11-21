resource "aws_cloudfront_distribution" "my_distribution" {
  origin {
    domain_name = "your-s3-bucket.s3.amazonaws.com"
    origin_id   = "S3BucketOrigin"
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"
}
