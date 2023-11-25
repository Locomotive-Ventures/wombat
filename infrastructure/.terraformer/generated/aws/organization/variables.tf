data "terraform_remote_state" "organization" {
  backend = "local"

  config = {
    path = "../../../../../infrastructure/.terraformer/generated/aws/organization/terraform.tfstate"
  }
}
