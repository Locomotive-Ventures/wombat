import json
import os
import logging
from dotenv import load_dotenv
from openai import OpenAI, OpenAIError

# Load environment variables
load_dotenv()

# Get API key
api_key = os.getenv("OPENAI_API_KEY")
if not api_key:
    raise ValueError("Missing OPENAI_API_KEY environment variable")

# Environment check
environment = os.getenv("ENVIRONMENT", "development")

# Configure logging based on environment
if environment == "production":
    logging.basicConfig(level=logging.ERROR, format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')
else:
    logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')

def lambda_handler(event, context):
    try:
        # Initialize the OpenAI client
        client = get_openai_client()

        # Generate the response using OpenAI's chat completion API
        response_content = get_openai_response(event, client)

        # Return the successful response
        return {
            'statusCode': 200,
            'body': json.dumps({'response': response_content})
        }

    except Exception as e:
        logging.error(f"Error in lambda_handler: {str(e)}")
        return {
            'statusCode': 500,
            'body': json.dumps({'error': 'Internal server error'})
        }

def get_openai_client():
    try:
        # Initialize the OpenAI client
        client = OpenAI(api_key=api_key)
        return client

    except OpenAIError as openai_error:
        logging.error(f"OpenAI API error: {openai_error}")
        raise
    except Exception as e:
        logging.error(f"Error initializing OpenAI client: {e}")
        raise

def get_openai_response(event, client):
    try:
        # Extract input from the event object
        user_input = event['queryStringParameters']['message']

        # Generate the response using OpenAI's chat completion API
        response = client.chat.completions.create(
            model="gpt-3.5-turbo-1106",
            messages=[
                {"role": "system", "content": "Your system prompt here"},
                {"role": "user", "content": user_input}
            ],
            max_tokens=1024,
            temperature=0.7,
            timeout=30
        )

        # Extract and return the generated message
        generated_message = response.choices[0].message.content
        return generated_message

    except OpenAIError as openai_error:
        logging.error(f"OpenAI API error: {openai_error}")
        raise ValueError("Error communicating with OpenAI API")
    except Exception as e:
        logging.error(f"Error generating response: {e}")
        raise ValueError("Error processing the input")

if __name__ == "__main__":
    try:
        client = get_openai_client()
        event = {
            'queryStringParameters': {
                'message': 'Hello, how are you?'
            }
        }
        response = lambda_handler(event, None)
        print(response)
    except Exception as e:
        logging.error(f"Runtime error: {e}")
