# Twillio Conversation Layer (Lambda)

## Overview

This README document explains the usage of the Wombat AI Twillio conversation layer, designed for integrating OpenAI's Large Language Model (LLM) with Twilio and AWS services (Lambda and DynamoDB) to handle conversational AI over phone calls. The script supports local testing and deployment on AWS Lambda with API Gateway.

## Getting Started

### Requirements

- Python 3.x
- Flask
- Boto3 (AWS SDK for Python)
- OpenAI Python Client
- Twilio Python Client
- AWS Account (for Lambda and DynamoDB)
- Twilio Account
- ngrok (for local testing)

### Installation

1. Clone the repository to your local machine.
2. Install the required dependencies:
   ```
   pip install -r requirents.txt
   ```
3. Set up the required environment variables in the .env file or your local environment:
    `OPENAI_API_KEY`: Your OpenAI API key.
    `TWILIO_ACCOUNT_SID`: Your Twilio Account SID.
    `TWILIO_AUTH_TOKEN`: Your Twilio Auth Token.
    `TWILIO_TWIML_URL`: The URL to your TwiML application.
    `TWILIO_FROM_NUMBER`: The Twilio phone number to use for outgoing calls.
    `ENVIRONMENT`: Set to development for local testing and production for deployment.

### Running the Application Locally

1. Start the Flask application:
   ```bash
   make start-app
   ```
2. On a seperate terminal to validate you can run:

   ```bash
   make test
   ```

### Deployment on AWS

1. Package your application for AWS Lambda.
2. Set up an API Gateway to trigger your Lambda function.
3. Ensure environment variables are configured in the Lambda settings.

### Testing

1. Validate the python application code is working
   - Send a POST request to your Flask application to test the OpenAI LLM integration:
      ```bash
      curl -X POST -H "Content-Type: application/json" -d '{"message": "Hello, my name is"}' http://localhost:5001/message
      ```
   - OR call the test function
      ```bash
      make test
      ```
2. Run `ngrok` to expose your local Flask application to the internet:
   ```bash
   make start-ngrok
   ```

   Note you might have to sign-up to ngrok to get a token and install locally. You can install on Mac OS using homebrew:
   ```bash
   brew install ngrok
   ```

   Once you have the token you can run:
   ```bash
   ngrok authtoken <your-token>
   ```

   If you have firewall issues, i.e. the localhost is working but not the ngrok url, you may need to update your firewall rules. On Mac OS you can do this by going to System Preferences > Security & Privacy > Firewall > Firewall Options and adding ngrok to the list of allowed applications.
