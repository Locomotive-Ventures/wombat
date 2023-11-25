data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "../../../../../infrastructure/.terraformer/generated/aws/vpc/terraform.tfstate"
  }
}
