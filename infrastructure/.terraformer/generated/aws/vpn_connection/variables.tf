data "terraform_remote_state" "customer_gateway" {
  backend = "local"

  config = {
    path = "../../../../../infrastructure/.terraformer/generated/aws/customer_gateway/terraform.tfstate"
  }
}

data "terraform_remote_state" "vpn_gateway" {
  backend = "local"

  config = {
    path = "../../../../../infrastructure/.terraformer/generated/aws/vpn_gateway/terraform.tfstate"
  }
}
