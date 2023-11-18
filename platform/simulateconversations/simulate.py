import json
import openai

# Set up your OpenAI API key
openai.api_key = 'YOUR_API_KEY'

# Define the prompt for the conversation simulation
prompt = """
You are simulating a conversation using OpenAI.

Conversation Simulation Prompt: Write your prompt here.
"""

# Run the simulation 100 times
for i in range(100):
    # Generate the conversation using OpenAI's chat completion API
    response = openai.Completion.create(
        engine='text-davinci-003',
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

    print(f"Simulation {i+1} completed and saved as {filename}")
