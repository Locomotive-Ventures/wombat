provider "aws" {
  region                   = "ap-southeast-2"
  shared_credentials_files = [module.terraform_global_variables.aws_credentials_file]
  skip_metadata_api_check  = true
}
