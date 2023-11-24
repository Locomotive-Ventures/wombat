terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.26"
    }
    twilio = {
      source  = "twilio/twilio"
      version = "~> 0.18.34"
    }
  }

  required_version = "~> 1.6.4"

  # Assume the S3 and DynamoDB resources have already been created
  # This simplifies setup, and we don't treat those as resources in terraform
  backend "s3" {
    key = "infrastructure/terraform/terraform.tfstate"
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

provider "twilio" {
  username = var.twilio_account_sid
  password = var.twilio_auth_token
}

module "compute" {
  source = "./compute"
}

module "frontend" {
  source = "./frontend"
}

module "operations" {
  source = "./operations"
}
module "storage" {
  source = "./storage"
}
