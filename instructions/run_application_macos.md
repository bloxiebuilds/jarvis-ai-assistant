# Running Your Jarvis AI Assistant on macOS

This guide provides detailed steps to launch and run your Jarvis AI Assistant on a macOS operating system.

## Prerequisites

Before proceeding, ensure you have completed the initial setup as described in `setup_instructions.md`, including:

*   n8n installed locally (via npm or Docker).
*   ElevenLabs account configured with your AI agent and custom tool webhook pointing to your n8n instance.
*   Lovable AI frontend (`index.html`) ready with the ElevenLabs widget embedded.
*   Python installed, and `mac_commander.py` placed in a known location (e.g., `/Users/YourUser/Jarvis_Scripts/`).

## Step-by-Step Execution

1.  **Start n8n:**
    *   **If installed via npm:** Open Terminal and run:
        ```bash
        n8n start
        ```
    *   **If installed via Docker:** Open Terminal and run:
        ```bash
        docker run -it --rm --name n8n -p 5678:5678 -v ~/.n8n:/home/node/.n8n n8n/n8n
        ```
    *   Wait for n8n to fully start. You should see messages indicating it's listening on `http://localhost:5678`.
    *   Ensure your `sample_jarvis_workflow` is active in the n8n interface.

2.  **Launch the Frontend:**
    *   Navigate to the `frontend_template` folder in Finder.
    *   Double-click `index.html` to open it in your default web browser.

3.  **Verify ElevenLabs Connection:**
    *   Ensure your browser has access to your microphone.
    *   The ElevenLabs widget (microphone button) should be visible and responsive on your frontend.

4.  **Interact with Jarvis:**
    *   Click the microphone button on your frontend.
    *   Speak your command, e.g., "Jarvis, open Steam." or "Jarvis, launch OBS."
    *   Observe the n8n execution logs (in your terminal where n8n is running) and the actions on your Mac.

## Using the One-Click Launcher (`start_jarvis.command`)

For convenience, a shell script `start_jarvis.command` is provided in the `finished_product` folder. This script attempts to automate the launch of n8n and your frontend.

1.  **Edit `start_jarvis.command`:**
    *   Right-click `start_jarvis.command` and select "Open With" -> "TextEdit" (or your preferred text editor).
    *   **Update n8n Command:** If you use Docker for n8n, uncomment the Docker line and comment out the npm line. Adjust the Docker volume mapping if your n8n data is stored elsewhere.
    *   **Update Frontend Path:** Ensure the `open` command for `index.html` correctly points to the location of your `index.html` file. For example, if `start_jarvis.command` is in `/Users/YourUser/Jarvis_AI/finished_product/` and `index.html` is in `/Users/YourUser/Jarvis_AI/frontend_template/`, you might use `open /Users/YourUser/Jarvis_AI/frontend_template/index.html`.

2.  **Make Executable:**
    *   Open Terminal.
    *   Navigate to the `finished_product` directory: `cd /path/to/jarvis_ai_setup/finished_product`
    *   Make the script executable: `chmod +x start_jarvis.command`

3.  **Run `start_jarvis.command`:**
    *   Double-click the `start_jarvis.command` file in Finder.
    *   This will open a Terminal window for n8n and then launch your web browser with the frontend.

**Important:** The shell script will open n8n in a new Terminal window. Keep this window open as long as you want Jarvis to be active. Closing it will stop n8n.
