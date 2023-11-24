# This file contains all the variables that are used in the terraform code
# Path: infrastructure/terraform/variables.tf

# Twilio variables
variable "twilio_account_sid" {
  description = "The Twilio account SID"
  type        = string

}
variable "twilio_auth_token" {
  description = "The Twilio auth token"
  type        = string
}

