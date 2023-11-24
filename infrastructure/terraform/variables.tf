# This file contains all the variables that are used in the terraform code
# Path: infrastructure/terraform/variables.tf

# Twilio variables
variable "twilio_account_sid" {}
variable "twilio_auth_token" {}
variable "australian_voice_number" {
  default = "+61259505161"
}
