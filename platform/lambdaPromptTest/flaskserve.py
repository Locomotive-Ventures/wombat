from flask import Flask, request, jsonify
import app as app_module  # Renaming the imported module to avoid conflict

flask_app = Flask(__name__)  # Renaming the Flask app instance

@flask_app.route('/message', methods=['POST'])
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
    response = app_module.lambda_handler(event, None)

    # Return the response as JSON
    return jsonify(response)

@flask_app.route('/', defaults={'path': ''})
@flask_app.route('/<path:path>', methods=['GET', 'POST', 'PUT', 'DELETE'])
def default_route(path):
    # Default message or error
    return jsonify({'message': 'Please use the "/message" route with a POST request to get a response.'}), 404

if __name__ == '__main__':
    flask_app.run(
        debug=True,
        port=5001,
    )
