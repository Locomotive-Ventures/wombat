# README for the Wombat AI Conversation Simulator Script

## Overview

This README document explains the usage of a Python script designed to test a sample OpenAI Large Language Model (LLM) prompt call, with the goal of integrating it with Twilio for handling phone calls. The setup allows for local testing as well as deployment on AWS Lambda and API Gateway.

## Getting Started

### Requirements

- Python 3.x
- Flask
- OpenAI API
- ngrok (for local testing)
- AWS Lambda and API Gateway (for deployment)
-
### Installation

1. Clone the repository to your local machine.
2. Install the required dependencies:
   ```
   pip install -r requirents.txt
   ```
3. Set up the required environment variables in the .env file or your local environment:
- `OPENAI_API_KEY`: Your OpenAI API key.
- `ENVIRONMENT`: Set to `development` for local testing and `production` for deployment.

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
