# Platform Code

This section of the repository is to hold individual services that make up the platform. Each service should be self contained and have its own README.md file.

## Active Platform Services

### [lambdaTwillioConvo](/platform/lambdaTwillioConvo)

This is the main service that handles the Twilio integration. It is a lambda function that is triggered by Twilio and will handle the conversation with the user. It will also store the conversation history in DynamoDB.

### [spikeFrontEndAndResourcesIntegration](/platform/spikeFrontEndAndResourcesIntegration)

This is a small local test for validating `AWS API Gateway` and our lambda functions through a mock user-interface.

## Archived Services and Code

### [lambdaPromptTest](/platform/lambdaPromptTest)

This is a simple lambda function that can be used to test the Twilio integration. It will return a simple message to the caller. This has been written to work both in AWS Lambda but also locally in CLI with ngrok and flask.

### [simulateConversations](/platform/simulateConversations)

This is a local python script used with OpenAI to simulate conversations. It is used to train the ML voice model on AWS Lex. This was later abandoned due to the complexities with AWS Lex and AWS Connect.
