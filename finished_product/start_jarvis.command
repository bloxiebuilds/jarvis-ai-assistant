#!/bin/bash

# --- Configuration ---
# Set the path to your n8n installation (if using npm)
N8N_PATH="n8n"

# Set the path to your frontend_template/index.html
# IMPORTANT: Adjust this path to your actual installation location
FRONTEND_PATH="../frontend_template/index.html"

# --- Start n8n (uncomment one based on your installation) ---
# Option 1: Start n8n via npm
# Note: This will keep the terminal window open for n8n
$N8N_PATH start &
N8N_PID=$!

# Option 2: Start n8n via Docker (uncomment and adjust if using Docker)
# docker run -it --rm --name n8n -p 5678:5678 -v ~/.n8n:/home/node/.n8n n8n/n8n &
# N8N_PID=$!

sleep 10

# --- Launch Frontend ---
open "$FRONTEND_PATH"

echo "Jarvis AI Assistant launched. Keep this terminal window open for n8n."

# Wait for n8n process to finish (if started in background)
wait $N8N_PID
