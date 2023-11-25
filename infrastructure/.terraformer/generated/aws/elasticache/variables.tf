data "terraform_remote_state" "sg" {
  backend = "local"

  config = {
    path = "../../../../../infrastructure/.terraformer/generated/aws/sg/terraform.tfstate"
  }
}

data "terraform_remote_state" "subnet" {
  backend = "local"

  config = {
    path = "../../../../../infrastructure/.terraformer/generated/aws/subnet/terraform.tfstate"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "../../../../../infrastructure/.terraformer/generated/aws/vpc/terraform.tfstate"
  }
}
