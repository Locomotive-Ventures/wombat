terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.26"
    }
  }

  required_version = "~> 1.6.4"

  backend "s3" {
    bucket         = "tf-s3-backend"
    key            = "/terraform.tfstate"
    region         = "ap-southeast-2" # Change this to your desired AWS region
    encrypt        = true
    dynamodb_table = "tf-statelock"
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_s3_bucket" "tf-s3-backend" {
  bucket = "tf-s3-backend"
  acl    = "private"
  #TODO: Lock security down further, flesh out details.
}

resource "aws_dynamodb_table" "tf-statelock" {
  name         = "tf-statelock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  #TODO: Check details and flesh out. 
}

