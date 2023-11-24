terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.26"
    }
  }

  required_version = "~> 1.6.4"

  # Assume the S3 and DynamoDB resources have already been created
  # This simplifies setup, and we don't treat those as resources in terraform
  backend "s3" {
    key            = "infrastructure/terraform/terraform.tfstate"
  }
}

provider "aws" {
  region = "ap-southeast-2"
}
