# Define the default target
.PHONY: all
all: start

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
