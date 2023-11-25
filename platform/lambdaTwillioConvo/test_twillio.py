from twilio.rest import Client
import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv("../../.env")

# Config and Credentials
twilio_account_sid = os.getenv("TWILIO_ACCOUNT_SID", "").strip()
twilio_auth_token = os.getenv("TWILIO_AUTH_TOKEN", "").strip()
twilio_twiml_url = os.getenv("TWILIO_TWIML_URL")
twilio_from_number = os.getenv("TWILIO_FROM_NUMBER")
recipient_number = '+61404638881'  # Replace with the recipient's number

print(f"SID length: {len(twilio_account_sid)}")
print(f"Token length: {len(twilio_auth_token)}")
print("-")
print(f"twilio_account_sid: {twilio_account_sid}")
print(f"twilio_auth_token: {twilio_auth_token}")
print(f"twilio_twiml_url: {twilio_twiml_url}")
print(f"twilio_from_number: {twilio_from_number}")
print(f"recipient_number: {recipient_number}")

# Initialize Twilio client
twilio_client = Client(
    twilio_account_sid,
    twilio_auth_token
)

call = twilio_client.calls.create(
    to=recipient_number,
    from_=twilio_from_number,
    url=twilio_twiml_url
)

print(f"Call initiated from: {twilio_from_number} to: {recipient_number}")
print(call)
