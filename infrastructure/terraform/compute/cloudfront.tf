resource "aws_cloudfront_distribution" "my_cloudfront_distribution" {
  enabled = true

  origin {
    domain_name = var.s3_static_website_domain_name # TO CHANGE
    origin_id   = "myS3Origin"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.my_origin_access_identity.cloudfront_access_identity_path
    }
  }

  origin {
    domain_name = aws_api_gateway_domain_name.dynamodb_api_domain_name
    origin_id   = "DynamoDBAPIOrigin"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "https-only"
      origin_ssl_protocols   = ""
    }
  }

  default_cache_behavior {
    target_origin_id       = "myS3Origin"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ""
    cached_methods         = ""

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CA", "GB", "DE"] # TO CHANGE
    }
  }

  viewer_certificate {
    # TO CHANGE
  }

  default_root_object = "index.html"
}


resource "aws_cloudfront_origin_access_identity" "my_origin_access_identity" {
  comment = "OAI for ${aws_s3_bucket.website_bucket.bucket}"
}


# CloudFront setup
# CloudFrontDistribution:
# Type: AWS::CloudFront::Distribution
# Properties:
#     DistributionConfig:

#     Origins:
#         - Id: myS3Origin
#         DomainName: !GetAtt [WebsiteBucket, DomainName]

#         S3OriginConfig:
#             OriginAccessIdentity: !Sub origin-access-identity/cloudfront/${OriginAccessIdentity}
#         - Id: DynamoDBAPIOrigin
#         DomainName: !Sub '${DynamoDBAPI}.execute-api.${AWS::Region}.amazonaws.com'

#         CustomOriginConfig:
#             HTTPPort: 80
#             HTTPSPort: 443
#             OriginProtocolPolicy: https-only
#     Enabled: true
#     DefaultCacheBehavior:
#         TargetOriginId: myS3Origin
#         ViewerProtocolPolicy: redirect-to-https
#         ForwardedValues:
#         QueryString: false
#         Cookies:
#             Forward: none
#     DefaultRootObject: index.html

# OriginAccessIdentity:
# Type: AWS::CloudFront::CloudFrontOriginAccessIdentity
# Properties:
#     CloudFrontOriginAccessIdentityConfig:
#     Comment: !Sub "OAI for ${WebsiteBucket}"