import json
import os
from openai import OpenAI

def lambda_handler(event, context):
    # Generate the response using OpenAI's chat completion API
    response = get_openai_response(event)
    response = {
        'statusCode': 200,
        'body': json.dumps({'response': response})
    }
    # Return the response
    return response

def get_openai_client():
    # Get api key
    api_key = os.getenv("OPENAI_API_KEY")

    # Load the OpenAI client
    try:
        client = OpenAI(api_key=api_key)
    except Exception as e:
        print("Failed to load OpenAI client")
        print(e)
        raise e
    return client

def get_openai_response(event):
    # Extract input from the event object
    user_input = event['queryStringParameters']['message']

    # Generate the response using OpenAI's chat completion API
    try:
        response = client.chat.completions.create(
            model="gpt-3.5-turbo-1106",
            #response_format={ "type": "json_object" },
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
        return {
            'statusCode': 200,
            'body': json.dumps({'response': generated_message})
        }

    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }

if __name__ == "__main__":
    client = get_openai_client()
    event = {
        'queryStringParameters': {
            'message': 'Hello, how are you?'
        }
    }
    print(lambda_handler(event, None))
