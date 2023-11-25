# README for the Wombat AI Conversation Simulator Script

## Overview

This README document explains the usage of a Python script designed for prototyping and simulating conversations for the Wombat AI project. The script leverages the OpenAI ChatGPT API to generate simulated emergency conversations, which are then saved as JSON files. This approach is aligned with ADR 002, which advocates using ChatGPT for rapid conversation prototyping in the development of Wombat AI.

## Requirements

- Python 3.6 or higher
- `openai` Python package
- `tqdm` Python package
- `python-dotenv` Python package
- An active OpenAI API key

## Installation

1. Ensure Python 3.6 or higher is installed on your system.
2. Install the required Python packages:
   ```bash
   pip install openai tqdm python-dotenv
	```
3. Clone the repository containing the script, or download the script file directly to your local machine.

## Configuration

Place your OpenAI API key in a .env file in the root directory of the script as follows:
```bash
OPENAI_API_KEY='your_api_key_here'
```
Ensure the prompt files are located in the specified paths within the script, or update the paths accordingly.

## Usage

1. Navigate to the directory containing the script.
2. Run the script using Python:
	```bash
	python simulate.py
	```
3. The script will read prompts from the specified files, use them to generate conversations through the OpenAI API, and save each conversation as a JSON file in the specified output folder.

## Output

- The script saves each simulated conversation as a JSON file in the ../../data/simulations directory (relative to the script's location).
- The naming convention for the output files is simulation_{number}.json, where {number} is the sequence number of the simulation.

## ADR 002: Context and Decision

- Status: Accepted
- Context: The development of Wombat AI requires efficient prototyping of emergency communication scenarios.
- Decision: Use ChatGPT for prototyping conversations, refining them before implementing in Amazon Lex.
- Consequences: Speeds up the design process but may introduce challenges in transferring conversational nuances between platforms.
- Alternatives Considered: Exclusive use of Amazon Lex for development.

Related Files
- System prompt file: prompt-simulation-lextranscripts-system.md
- User prompt file: prompt-simulation-lextranscripts-user.md
- Example output transcript: transcript-simulation-gpt.json
