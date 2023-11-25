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
twilio_flow_sid = os.getenv("TWILIO_FLOW_SID", "").strip()
twilio_from_number = os.getenv("TWILIO_FROM_NUMBER")
recipient_number = '+61404638881'  # Replace with the recipient's number

try:
    # Initialize Twilio client
    twilio_client = Client(twilio_account_sid, twilio_auth_token)

    # Execute Studio Flow
    execution = twilio_client.studio \
        .flows(twilio_flow_sid) \
        .executions \
        .create(to=recipient_number, from_=twilio_from_number)

    logging.info(f"Call initiated via flow {twilio_flow_sid} from: {twilio_from_number} to: {recipient_number}")
    logging.info(f"Call execution SID: {execution.sid}")

    # Polling for call completion
    while True:
        print(".", end="", flush=True)  # Print a dot without newline
        updated_execution = twilio_client.studio \
            .flows(twilio_flow_sid) \
            .executions(execution.sid) \
            .fetch()

        if updated_execution.status != execution.status:
            execution = updated_execution
            logging.info(f"Flow Execution Status Updated: {execution.status}")

        if execution.status in ["ended", "failed"]:
            break

        time.sleep(5)  # Poll every 5 seconds

    logging.info(f"Final Flow Execution Status: {execution.status}")

except TwilioRestException as e:
    logging.error(f"Twilio API error: {e}")
except Exception as e:
    logging.error(f"General error: {e}")
