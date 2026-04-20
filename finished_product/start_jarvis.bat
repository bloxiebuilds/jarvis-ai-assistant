@echo off

REM --- Configuration ---
REM Set the path to your n8n installation (if using npm)
SET N8N_PATH=n8n

REM Set the path to your frontend_template/index.html
REM IMPORTANT: Adjust this path to your actual installation location
SET FRONTEND_PATH="..\frontend_template\index.html"

REM --- Start n8n (uncomment one based on your installation) ---
REM Option 1: Start n8n via npm
start "n8n Server" cmd /k "%N8N_PATH% start"

REM Option 2: Start n8n via Docker (uncomment and adjust if using Docker)
REM start "n8n Docker" cmd /k "docker run -it --rm --name n8n -p 5678:5678 -v %USERPROFILE%/.n8n:/home/node/.n8n n8n/n8n"

timeout /t 10 > NUL

REM --- Launch Frontend ---
start "Jarvis Frontend" %FRONTEND_PATH%

echo Jarvis AI Assistant launched. Keep the n8n server window open.
