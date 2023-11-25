# Define variables to accept credentials
variable "twilio_account_sid" {}
variable "twilio_auth_token" {}

# # Configure Twilio provider using the passed credentials
# provider "twilio" {
#   username = var.twilio_account_sid
#   password = var.twilio_auth_token
# }
# resource "twilio_api_accounts_incoming_phone_numbers" "phone_number" {
#   account_sid   = "SK22afeb94a7a8693ce7713cf482aa2f75"
#   area_code     = "61"
#   friendly_name = "terraform phone number"
#   sms_url       = "https://demo.twilio.com/welcome/sms/reply"
#   voice_url     = "https://demo.twilio.com/docs/voice.xml"
#   # phone_number  = "+61256026523"
# }

# output "phone_numbers" {
#   value = twilio_api_accounts_incoming_phone_numbers.phone_number
# }
