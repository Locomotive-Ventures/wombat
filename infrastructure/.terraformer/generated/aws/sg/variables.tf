data "terraform_remote_state" "sg" {
  backend = "local"

  config = {
    path = "../../../../../infrastructure/.terraformer/generated/aws/sg/terraform.tfstate"
  }
}
