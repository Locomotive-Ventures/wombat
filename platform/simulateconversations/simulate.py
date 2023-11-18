import json
import logging
import openai
import os
from dotenv import load_dotenv
from tqdm import tqdm

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Load API key from .env file
load_dotenv()
openai.api_key = os.getenv("OPENAI_API_KEY")

# Define the path to the prompt file
prompt_file = "../../docs/prompts/prompt-simulation-lextranscripts.md"

# Read the prompt from the file
with open(prompt_file, 'r') as file:
    prompt = file.read()

# Run the simulation 100 times
for i in tqdm(range(100), desc="Simulating conversations"):
    # Generate the conversation using OpenAI's chat completion API
    response = openai.Completion.create(
        model="gpt-4-1106-preview",
        prompt=prompt,
        max_tokens=100,
        n=1,
        stop=None,
        temperature=0.7
    )

    # Extract the generated message from the API response
    message = response.choices[0].text.strip()

    # Save the conversation as a JSON file
    filename = f"simulation_{i+1}.json"
    with open(filename, 'w') as file:
        json.dump({'prompt': prompt, 'message': message}, file)

    logging.info(f"Simulation {i+1} completed and saved as {filename}")
