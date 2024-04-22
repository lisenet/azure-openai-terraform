#!/usr/bin/python3.9

# pip install openai==0.28

import os
import openai

openai.api_type = "azure"
openai.api_version = "2024-02-01" 
openai.api_base = os.getenv("AZURE_OPENAI_ENDPOINT")  # Your Azure OpenAI resource's endpoint value.
openai.api_key = os.getenv("AZURE_OPENAI_API_KEY")

AZURE_DEPLOYMENT_NAME="lisenet-openai"

prompt = "What is the capital city of the UK?"

messages= [
  {"role":"system", "content":"You are an assistant."},
  {"role":"user", "content":prompt}
]

response = openai.ChatCompletion.create(
  engine=AZURE_DEPLOYMENT_NAME, # engine = "deployment_name".
  max_tokens=64,
  temperature=0.1,
  n=1,
  messages=messages
)

print(response)
