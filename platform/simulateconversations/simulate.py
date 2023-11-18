import json
import logging
import os
from openai import OpenAI
from dotenv import load_dotenv
from tqdm import tqdm

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Load API key from .env file
load_dotenv()
api_key = os.getenv("OPENAI_API_KEY")
number_of_simulations = 100

# Specify the folder to save the JSON files
output_folder = "../../data/simulations"
os.makedirs(output_folder, exist_ok=True)

# Define the path to the prompt file
system_prompt_file = "../../docs/prompts/prompt-simulation-lextranscripts-system.md"
with open(system_prompt_file, 'r') as file:
    system_prompt = file.read()
user_prompt_file = "../../docs/prompts/prompt-simulation-lextranscripts-user.md"
with open(user_prompt_file, 'r') as file:
    user_prompt = file.read()

# Init the OpenAI client
try:
    client = OpenAI(api_key=api_key)
except Exception as e:
    logging.error(f"Failed to initialize OpenAI client: {e}")
    exit(1)

# Run the simulation n times
for i in tqdm(range(number_of_simulations), desc="Simulating conversations"):
    # Generate the conversation using OpenAI's chat completion API
    response = client.chat.completions.create(
        model="gpt-3.5-turbo-1106",
        messages=[
            {
                "role": "system",
                "content": system_prompt
            },
            {
                "role": "user",
                "content": user_prompt
            }
        ],
        #response_format={ "type": "json_object" },
        max_tokens=1024,
        n=1,
        stop=None,
        temperature=0.7,
        timeout=30,
    )

    # Extract the generated message from the API response
    message = response.choices[0].message.content

    # Parse the message content as JSON
    try:
        message_json = json.loads(message)
    except json.JSONDecodeError:
        logging.error("Failed to decode JSON from the message content")
        continue  # Skip this iteration if the message content is not valid JSON

    # Save the conversation as a JSON file
    filename = f"{output_folder}/simulation_{i+1}.json"
    with open(filename, 'w') as file:
        json.dump(message_json, file, indent=4)  # Pretty print


    logging.info(f"Simulation {i+1} completed and saved as {filename}")
    exit(1)
