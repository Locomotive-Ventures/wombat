from twilio.rest import Client
import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Config and Credentials
twilio_account_sid = os.getenv("TWILIO_ACCOUNT_SID")
twilio_auth_token = os.getenv("TWILIO_AUTH_TOKEN")
twilio_twiml_url = os.getenv("TWILIO_TWIML_URL")
twilio_from_number = os.getenv("TWILIO_FROM_NUMBER")
recipient_number = '+61404638881'  # Replace with the recipient's number

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
