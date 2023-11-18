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

# Define the path to the prompt file
prompt_file = "../../docs/prompts/prompt-simulation-lextranscripts.md"

# Read the prompt from the file
with open(prompt_file, 'r') as file:
    prompt = file.read()

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
        #model="gpt-4-1106-preview",
        model="gpt-3.5-turbo-1106",
        messages=[
            {
                "role": "system",
                "content": "You are a service to provide json output for a conversation simulator. The user prompt will have all the instructions you require."
            },
            {
                "role": "user",
                "content": prompt
            }
        ],
        response_format={ "type": "json_object" },
        max_tokens=1024,
        n=1,
        stop=None,
        temperature=0.7,
        timeout=30,
    )

    # print(response)
    # exit(1)

    # Extract the generated message from the API response
    message = response.choices[0].message.content

    # Save the conversation as a JSON file
    filename = f"simulation_{i+1}.json"
    with open(filename, 'w') as file:
        json.dump({'prompt': prompt, 'message': message}, file)

    logging.info(f"Simulation {i+1} completed and saved as {filename}")
