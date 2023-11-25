from twilio.rest import Client
import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Twilio credentials from environment variables
account_sid =
auth_token =

# Twilio phone number and the recipient number
twilio_from_number =  "+61256026523"
twilio_twiml_url = "https://studio.twilio.com/v2/Flows/FW981d3d5fbc7155e71572327a9005fbcf/Executions"
recipient_number = '+61404638881'  # Replace with the recipient's number

# Initialize Twilio client
client = Client(account_sid, auth_token)

# # Send SMS
# message = client.messages.create(
#     to=recipient_number,
#     from_=twilio_number,
#     body="Hello, this is a test message from Twilio!"
# )
call = client.calls.create(
    to=recipient_number,
    from_=twilio_from_number,
    url=twilio_twiml_url
    # message="hi how are you?"
)

# print(f"Sent message with SID: {message.sid}")
print(call)
