import os
import logging
import time
from twilio.rest import Client
from twilio.base.exceptions import TwilioRestException
from dotenv import load_dotenv

# Initialize logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Load environment variables
load_dotenv("../../.env")

# Config and Credentials
twilio_account_sid = os.getenv("TWILIO_ACCOUNT_SID", "").strip()
twilio_auth_token = os.getenv("TWILIO_AUTH_TOKEN", "").strip()
twilio_twiml_url = os.getenv("TWILIO_TWIML_URL")
twilio_from_number = os.getenv("TWILIO_FROM_NUMBER")
recipient_number = '+61404638881'  # Replace with the recipient's number

try:
    # Initialize Twilio client
    twilio_client = Client(twilio_account_sid, twilio_auth_token)

    # Create and log call
    call = twilio_client.calls.create(
        to=recipient_number,
        from_=twilio_from_number,
        url=twilio_twiml_url
    )

    logging.info(f"Call initiated from: {twilio_from_number} to: {recipient_number}")
    logging.info(f"Call SID: {call.sid}")

    # Polling for call completion
    while True:
        print(".", end="", flush=True)  # Print a dot without newline
        updated_call = twilio_client.calls(call.sid).fetch()

        if updated_call.status != call.status:
            call = updated_call
            logging.info(f"Call Status Updated: {call.status}")

        if call.status == "completed" or call.status == "failed":
            break

        time.sleep(5)  # Poll every 5 seconds

    logging.info(f"Final Call Status: {call.status}")

except TwilioRestException as e:
    logging.error(f"Twilio API error: {e}")
except Exception as e:
    logging.error(f"General error: {e}")
