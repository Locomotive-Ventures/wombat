resource "aws_cloudfront_distribution" "tfer--E13BOF66B7QH22" {
  default_cache_behavior {
    allowed_methods = ["GET", "HEAD"]
    cached_methods  = ["GET", "HEAD"]
    compress        = "false"
    default_ttl     = "86400"

    forwarded_values {
      cookies {
        forward = "none"
      }

      query_string = "false"
    }

    max_ttl                = "31536000"
    min_ttl                = "0"
    smooth_streaming       = "false"
    target_origin_id       = "myS3Origin"
    viewer_protocol_policy = "redirect-to-https"
  }

  default_root_object = "index.html"
  enabled             = "true"
  http_version        = "http1.1"
  is_ipv6_enabled     = "true"

  origin {
    connection_attempts      = "3"
    connection_timeout       = "10"
    domain_name              = "wombat-websitebucket-2csjalc5ms6v.s3.amazonaws.com"
    origin_access_control_id = "EXOOX2I4YMHSC"
    origin_id                = "myS3Origin"
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  retain_on_delete = "false"

  viewer_certificate {
    cloudfront_default_certificate = "true"
    minimum_protocol_version       = "TLSv1"
  }
}
