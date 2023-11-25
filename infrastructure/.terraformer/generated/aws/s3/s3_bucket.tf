resource "aws_s3_bucket" "tfer--cf-templates-1h5bilay8ris2-ap-southeast-2" {
  bucket        = "cf-templates-1h5bilay8ris2-ap-southeast-2"
  force_destroy = "false"

  grant {
    id          = "b2836cae8717abd6083c2c7498a520e65fe85e8fc82133a0b4130aeb9ce9ede5"
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
  }

  object_lock_enabled = "false"
  request_payer       = "BucketOwner"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }

      bucket_key_enabled = "false"
    }
  }

  versioning {
    enabled    = "false"
    mfa_delete = "false"
  }
}

resource "aws_s3_bucket" "tfer--wombat-tf-s3-backend" {
  bucket        = "wombat-tf-s3-backend"
  force_destroy = "false"

  grant {
    id          = "b2836cae8717abd6083c2c7498a520e65fe85e8fc82133a0b4130aeb9ce9ede5"
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
  }

  object_lock_enabled = "false"
  request_payer       = "BucketOwner"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }

      bucket_key_enabled = "true"
    }
  }

  versioning {
    enabled    = "false"
    mfa_delete = "false"
  }
}

resource "aws_s3_bucket" "tfer--wombat-warden-s3-static-website" {
  bucket        = "wombat-warden-s3-static-website"
  force_destroy = "false"

  grant {
    id          = "b2836cae8717abd6083c2c7498a520e65fe85e8fc82133a0b4130aeb9ce9ede5"
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
  }

  object_lock_enabled = "false"
  request_payer       = "BucketOwner"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }

      bucket_key_enabled = "false"
    }
  }

  versioning {
    enabled    = "false"
    mfa_delete = "false"
  }

  website {
    error_document = "error.html"
    index_document = "index.html"
  }
}

resource "aws_s3_bucket" "tfer--wombat-websitebucket-2csjalc5ms6v" {
  bucket        = "wombat-websitebucket-2csjalc5ms6v"
  force_destroy = "false"

  grant {
    id          = "b2836cae8717abd6083c2c7498a520e65fe85e8fc82133a0b4130aeb9ce9ede5"
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
  }

  object_lock_enabled = "false"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "s3:GetObject",
      "Condition": {
        "StringEquals": {
          "AWS:SourceArn": "arn:aws:cloudfront::692811742553:distribution/E13BOF66B7QH22"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudfront.amazonaws.com"
      },
      "Resource": "arn:aws:s3:::wombat-websitebucket-2csjalc5ms6v/*"
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  request_payer = "BucketOwner"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }

      bucket_key_enabled = "false"
    }
  }

  versioning {
    enabled    = "false"
    mfa_delete = "false"
  }

  website {
    index_document = "index.html"
  }
}
