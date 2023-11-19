# Define the default target
.PHONY: default
default: help

# Help target to list available commands
.PHONY: help
help:
	@echo "Available commands:"
	@echo "  start        : Start the application and ngrok"
	@echo "  start-app    : Start the Flask application"
	@echo "  start-ngrok  : Start ngrok to expose Flask application"

# Target to start the application and ngrok
.PHONY: start
start: start-app start-ngrok

# Target to start the application
.PHONY: start-app
start-app:
	@echo "Starting the application..."
	# Command to start your application
	python app.py &

# Target to start ngrok
.PHONY: start-ngrok
start-ngrok:
	@echo "Starting ngrok..."
	# Command to start ngrok and expose your application
	ngrok http 8000

# Add other targets as necessary, like stop, clean, etc.
