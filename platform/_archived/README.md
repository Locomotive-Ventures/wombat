## Archived Platform Code

### [lambdaPromptTest](/platform/lambdaPromptTest)

This is a simple lambda function that can be used to test the Twilio integration. It will return a simple message to the caller. This has been written to work both in AWS Lambda but also locally in CLI with ngrok and flask.

### [simulateConversations](/platform/simulateConversations)

This is a local python script used with OpenAI to simulate conversations. It is used to train the ML voice model on AWS Lex. This was later abandoned due to the complexities with AWS Lex and AWS Connect.
