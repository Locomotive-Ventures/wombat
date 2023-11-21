resource "aws_s3_bucket" "s3_bucket_static_website" {
  bucket = "wombat_warden_s3_static_website"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}
