# This file contains all the variables that are used in the terraform code
# Path: infrastructure/terraform/variables.tfvars

# Twilio variables
variable "twilio_account_sid" {
  description = "The Twilio account SID"
  type        = string
  default     = ""

}
variable "twilio_auth_token" {
  description = "The Twilio auth token"
  type        = string
  default     = ""
}

variable "s3_static_website_domain_name" {
  description = "S3 static website bucket name"
  type        = string
  default     = "myS3Origin"
}

