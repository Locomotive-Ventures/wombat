# Define the default target
.PHONY: default
default: help

# Load .env file
ifneq (,$(wildcard ./.env))
    include .env
    export
endif

# Help target to list available commands
.PHONY: help
help:
	@echo "Available commands:"
	@echo "  start        : Start the application and ngrok"
	@echo "  test         : Test the Flask application with a curl POST request"
	@echo "  start-app    : Start the Flask application"
	@echo "  start-ngrok  : Start ngrok to expose Flask application"

# Target to start the application and ngrok
.PHONY: start
start: start-app start-ngrok

# Target to start the Flask application
.PHONY: start-app
start-app:
	@echo "Starting the Flask application..."
	# Command to start your Flask application
	python flaskserve.py &

# Target to start ngrok
.PHONY: start-ngrok
start-ngrok:
	@echo "Starting ngrok..."
	# Command to start ngrok and expose your application
	ngrok http 5001

# Simple Flask test using curl
.PHONY: test
test:
	@echo "Testing Flask app with curl..."
	curl -X POST http://localhost:5001/message -H "Content-Type: application/json" -d '{"message": "Hello"}'
