import json
import os
from openai import OpenAI

def lambda_handler(event, context):
    # Initialize the OpenAI client
    client = get_openai_client()

    # Generate the response using OpenAI's chat completion API
    response_content = get_openai_response(event, client)

    # Return the response
    return {
        'statusCode': 200,
        'body': json.dumps({'response': response_content})
    }

def get_openai_client():
    # Get API key
    api_key = os.getenv("OPENAI_API_KEY")

    # Initialize the OpenAI client
    try:
        client = OpenAI(api_key=api_key)
        return client
    except Exception as e:
        print("Failed to load OpenAI client:", e)
        raise e

def get_openai_response(event, client):
    # Extract input from the event object
    user_input = event['queryStringParameters']['message']

    # Generate the response using OpenAI's chat completion API
    try:
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

    except Exception as e:
        return f"Error: {str(e)}"

if __name__ == "__main__":
    client = get_openai_client()
    event = {
        'queryStringParameters': {
            'message': 'Hello, how are you?'
        }
    }
    response = lambda_handler(event, None)
    print(response)
