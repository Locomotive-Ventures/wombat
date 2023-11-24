resource "twilio_phone_numbers_incoming_v1_phone_number" "australian_voice_number" {
  # The phone number to purchase
  phone_number = var.australian_voice_number
  # The SID of the account that should own this phone number
  account_sid = var.twilio_account_sid
}
