resource "twilio_api_accounts_incoming_phone_numbers" "phone_number" {
  account_sid   = "SK22afeb94a7a8693ce7713cf482aa2f75"
  area_code     = "61"
  friendly_name = "terraform phone number"
  sms_url       = "https://demo.twilio.com/welcome/sms/reply"
  voice_url     = "https://demo.twilio.com/docs/voice.xml"
}

output "phone_numbers" {
  value = twilio_api_accounts_incoming_phone_numbers.phone_number
}
