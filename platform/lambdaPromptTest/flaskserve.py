from flask import Flask, request, jsonify
import app  # Import functions from app.py

app = Flask(__name__)

@app.route('/message', methods=['POST'])
def handle_message():
    # Extract the message from the POST request
    data = request.json
    if not data or 'message' not in data:
        return jsonify({'error': 'No message provided'}), 400

    user_input = data['message']

    # Create an event-like structure for compatibility with the app's lambda_handler
    event = {
        'queryStringParameters': {'message': user_input}
    }

    # Use the lambda_handler function from app.py
    response = app.lambda_handler(event, None)

    # Return the response as JSON
    return jsonify(response)

if __name__ == '__main__':
    app.run(debug=True)
