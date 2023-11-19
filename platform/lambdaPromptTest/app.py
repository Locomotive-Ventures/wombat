import json
import os
from openai import OpenAI

def lambda_handler(event, context):
    # Initialize OpenAI client
    api_key = os.getenv("OPENAI_API_KEY")
    client = OpenAI(api_key=api_key)

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
        return {
            'statusCode': 200,
            'body': json.dumps({'response': generated_message})
        }

    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }
