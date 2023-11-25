import json
import boto3
import os
import logging
from openai import OpenAI, OpenAIError
from twilio.rest import Client

# Load environment variables
load_dotenv()

# Twilio and OpenAI credentials
twilio_account_sid = os.getenv("TWILIO_ACCOUNT_SID")
twilio_auth_token = os.getenv("TWILIO_AUTH_TOKEN")
twilio_twiml_url = os.getenv("TWILIO_TWIML_URL")
twilio_from_number = os.getenv("TWILIO_FROM_NUMBER")
openai_api_key = os.getenv("OPENAI_API_KEY")


# DynamoDB setup
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('ConversationHistory')

# Twilio client
twilio_client = Client(twilio_account_sid, twilio_auth_token)

# OpenAI client
openai_client = OpenAI(api_key=openai_api_key)

def lambda_handler(event, context):
    phone_number = event['queryStringParameters']['phone_number']
    message_context = event['queryStringParameters'].get('message_context', '')
    conversation_id = event['queryStringParameters']['conversation_id']

    # Check for initial call from Twilio or subsequent API Gateway call
    if 'initial_call' in event['queryStringParameters']:
        # Prepare initial conversation context
        initial_response = prepare_initial_response(message_context)
        save_conversation_history(conversation_id, initial_response)

        # Initiate call using Twilio
        initiate_call(phone_number, conversation_id)
    else:
        return continue_conversation(conversation_id, phone_number, message_context)

def prepare_initial_response(message_context):
    # Generate initial response from OpenAI
    conversation_history = [{"role": "system", "content": message_context}]
    response = get_openai_response(conversation_history)
    conversation_history.append({"role": "assistant", "content": response})
    return conversation_history

def initiate_call(phone_number, conversation_id):
    # Initiate call using Twilio
    call = twilio_client.calls.create(
        to=phone_number,
        from_='<Your Twilio Number>',
        url='<URL to your TwiML with conversation_id parameter>'
    )
    logging.info(f"Call initiated to {phone_number} with conversation_id {conversation_id}")
    return {'statusCode': 200, 'body': json.dumps({'message': 'Call initiated'})}

def continue_conversation(conversation_id, phone_number, message_context):
    # Retrieve conversation history from DynamoDB
    conversation_history = get_conversation_history(conversation_id)
    conversation_history.append({"role": "user", "content": message_context})

    # Generate response using OpenAI
    response = get_openai_response(conversation_history)
    conversation_history.append({"role": "assistant", "content": response})

    # Save updated conversation history to DynamoDB
    save_conversation_history(conversation_id, conversation_history)

    # Return the response
    return {'statusCode': 200, 'body': json.dumps({'response': response})}

def get_openai_response(conversation_history):
    try:
        response = openai_client.chat.completions.create(
            model="gpt-3.5-turbo-1106",
            messages=conversation_history,
            max_tokens=300,
            temperature=0.7,
            timeout=30
        )
        return response.choices[0].message.content
    except OpenAIError as e:
        logging.error(f"OpenAI API error: {e}")
        raise
    except Exception as e:
        logging.error(f"Error generating response: {e}")
        raise

def get_conversation_history(conversation_id):
    # Fetch conversation history from DynamoDB
    try:
        response = table.get_item(Key={'conversation_id': conversation_id})
        return response['Item']['history']
    except Exception as e:
        logging.error(f"Error fetching conversation history: {e}")
        return []

def save_conversation_history(conversation_id, history):
    # Save conversation history to DynamoDB
    try:
        table.put_item(Item={'conversation_id': conversation_id, 'history': history})
    except Exception as e:
        logging.error(f"Error saving conversation history: {e}")

# Example execution for testing
if __name__ == "__main__":
    test_event = {
        'queryStringParameters': {
            'phone_number': '+1234567890',
            'message_context': 'Hello, how can I help you?',
            'conversation_id': '12345',
            'initial_call': True  # Set to False for subsequent messages
        }
    }
    print(lambda_handler(test_event, None))
