import os
import logging
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

# Logging environment variable details (for debugging, remove in production)
logging.debug(f"SID length: {len(twilio_account_sid)}")
logging.debug(f"Token length: {len(twilio_auth_token)}")
logging.debug(f"Twilio Account SID: {twilio_account_sid}")
logging.debug(f"Twilio Auth Token: {twilio_auth_token}")
logging.debug(f"Twilio TWIML URL: {twilio_twiml_url}")
logging.debug(f"Twilio From Number: {twilio_from_number}")
logging.debug(f"Recipient Number: {recipient_number}")

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
    logging.info(f"Call Status: {call.status}")

except TwilioRestException as e:
    logging.error(f"Twilio API error: {e}")
except Exception as e:
    logging.error(f"General error: {e}")

# Polling for call completion (optional, based on your requirement)
# import time
# while True:
#     updated_call = twilio_client.calls(call.sid).fetch()
#     logging.info(f"Updated Call Status: {updated_call.status}")
#     if updated_call.status == "completed":
#         break
#     time.sleep(5)  # Poll every 5 seconds
