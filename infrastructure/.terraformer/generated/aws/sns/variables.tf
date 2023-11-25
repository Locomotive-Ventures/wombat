data "terraform_remote_state" "sns" {
  backend = "local"

  config = {
    path = "../../../../../infrastructure/.terraformer/generated/aws/sns/terraform.tfstate"
  }
}

data "terraform_remote_state" "sqs" {
  backend = "local"

  config = {
    path = "../../../../../infrastructure/.terraformer/generated/aws/sqs/terraform.tfstate"
  }
}
