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
        user_id = event['queryStringParameters']['user_id']  # Unique user identifier
        user_input = event['queryStringParameters']['message']

        # Retrieve conversation history from DynamoDB
        conversation_history = get_conversation_history(user_id)

        # Append the new user message to the history
        conversation_history.append({"role": "user", "content": user_input})

        # Generate the response using OpenAI's chat completion API
        response = client.chat.completions.create(
            model="gpt-3.5-turbo-1106",
            messages=conversation_history,
            max_tokens=300,
            temperature=0.7,
            timeout=30
        )

        # Extract the generated message
        generated_message = response.choices[0].message.content

        # Append the assistant's message to the conversation history
        conversation_history.append({"role": "assistant", "content": generated_message})

        # Save updated conversation history to DynamoDB
        save_conversation_history(user_id, conversation_history)

        return generated_message

    except OpenAIError as openai_error:
        logging.error(f"OpenAI API error: {openai_error}")
        raise ValueError("Error communicating with OpenAI API")
    except Exception as e:
        logging.error(f"Error generating response: {e}")
        raise ValueError("Error processing the input")

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
