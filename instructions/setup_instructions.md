# Detailed Setup Instructions for Jarvis AI Assistant

This document provides step-by-step instructions to set up your Jarvis-like AI assistant using Lovable AI, ElevenLabs, and n8n.

## 1. Setting up n8n (Automation Engine)

1.  **Install n8n Locally:**
    *   **Using npm (Node.js Package Manager):** Ensure you have Node.js installed. Open your terminal or command prompt and run:
        ```bash
        npm install n8n -g
        n8n start
        ```
    *   **Using Docker:** If you have Docker installed, you can run n8n with:
        ```bash
        docker run -it --rm --name n8n -p 5678:5678 -v ~/.n8n:/home/node/.n8n n8n/n8n
        ```
    *   Access n8n in your browser at `http://localhost:5678`.

2.  **Import the Sample Workflow:**
    *   In the n8n interface, click on "Workflows" in the left sidebar.
    *   Click "New" -> "Import from JSON".
    *   Upload the `sample_jarvis_workflow.json` file located in the `n8n_workflows` folder of this package.

3.  **Configure the Webhook:**
    *   Once imported, open the `sample_jarvis_workflow`.
    *   Locate the "Webhook" node. Copy its URL. This URL will be used in ElevenLabs.
    *   Ensure the workflow is activated (toggle the switch in the top right corner).

4.  **Install Python Dependencies for PC Control:**
    *   The `pc_commander.py` script (found in `finished_product` folder) requires Python and some libraries.
    *   Install Python (if not already installed) from [python.org](https://www.python.org/).
    *   Install the `psutil` library (for process management) and `pyautogui` (for GUI automation, if needed for more complex tasks) by running:
        ```bash
        pip install psutil pyautogui
        ```

## 2. Setting up ElevenLabs (Voice & Conversational Layer)

1.  **Create an ElevenLabs Account:** Go to [ElevenLabs](https://elevenlabs.io/) and sign up.

2.  **Create a Voice:**
    *   Navigate to "VoiceLab" to create a custom voice. You can use "Voice Cloning" to replicate a voice (e.g., Jarvis) or choose from their pre-made voices.

3.  **Create a Conversational AI Agent:**
    *   Go to the "Projects" or "AI Studio" section (interface may vary).
    *   Create a new conversational agent.
    *   **System Prompt:** Define Jarvis's personality. Example:
        ```
        You are Jarvis, an advanced AI assistant for a human user. You are highly efficient, slightly witty, and always ready to assist with PC automation and information retrieval. Respond concisely and professionally.
        ```
    *   **Custom Tool Integration:** Configure a custom tool that points to the n8n Webhook URL you copied earlier. The tool should be designed to accept parameters like `application_name` for opening applications.

## 3. Setting up Lovable AI (Front-End Interface)

1.  **Create a Lovable AI Project:** Go to [Lovable AI](https://lovable.dev/) and create a new project. Use natural language prompts to design a futuristic UI.

2.  **Embed ElevenLabs Widget:**
    *   In ElevenLabs, locate the embed code for your conversational widget.
    *   Paste this code into the `index.html` file (or your Lovable project's equivalent) in the `frontend_template` folder. This will integrate the microphone button and voice interaction directly into your web interface.

## 4. Integrating PC Control with n8n and Python

1.  **Place `pc_commander.py`:** Ensure the `pc_commander.py` script from the `finished_product` folder is placed in a known location on your system (e.g., `C:\Jarvis_Scripts\pc_commander.py`).

2.  **Modify n8n Workflow (Execute Command Node):**
    *   In your n8n workflow, the "Execute Command" node currently has a placeholder command.
    *   Modify it to call your Python script. For example:
        ```
        python C:\Jarvis_Scripts\pc_commander.py {{ $json.application_name }}
        ```
    *   This will pass the `application_name` (e.g., "Steam", "OBS") from ElevenLabs to your Python script.

## 5. Testing Your Jarvis AI Assistant

1.  Ensure n8n is running locally and the workflow is active.
2.  Open your Lovable AI frontend in a browser.
3.  Click the microphone button and say a command, e.g., "Jarvis, open Steam." or "Jarvis, launch OBS."
4.  Observe the n8n workflow execution and your PC responding to the commands.

By following these steps, you will have a fully functional, voice-controlled AI assistant capable of automating tasks on your PC. Remember to customize the system prompt and n8n workflows to expand Jarvis's capabilities further!

## 6. Creating Custom Modes (e.g., Gaming Mode, Work Mode)

To create custom modes, you will primarily work within n8n to define new workflows or modify existing ones based on specific voice commands.

1.  **Define Your Mode's Trigger:** Decide what voice command will activate your mode (e.g., "Activate Gaming Mode," "Start Work Session").

2.  **Create a New n8n Workflow (or modify existing):**
    *   **New Workflow:** For a completely new mode, create a new n8n workflow starting with a Webhook node. This webhook will be triggered by ElevenLabs when the mode command is recognized.
    *   **Existing Workflow:** For modes that are variations of existing tasks, you can add conditional logic (e.g., an `IF` node) within your main n8n workflow to check for the mode command.

3.  **Map Commands to Actions:** Within the n8n workflow, use various nodes to define the actions for your mode:
    *   **Execute Command Node:** To launch applications (Steam, OBS, specific work software), open files, or run scripts.
        *   **For Windows:** Use `start <application_path>` or `start <URL>`.
        *   **For macOS:** Use `open -a "Application Name"` or `open <URL>`.
    *   **HTTP Request Node:** To interact with web services, smart home devices, or OBS Studio via `obs-websocket`.
    *   **Function Node:** For custom logic using JavaScript.
    *   **Other Integration Nodes:** n8n has hundreds of integrations for various services (Google Calendar, Slack, etc.).

4.  **Update ElevenLabs Custom Tool:** If you create a new n8n webhook for a mode, you'll need to update your ElevenLabs agent to include a new custom tool that points to this new webhook. Ensure the system prompt in ElevenLabs is aware of your new mode commands.

5.  **Use `templates/mode_template.json`:** This file provides a basic structure for defining a mode. You can use it as a conceptual guide to plan out the applications and scripts involved in your custom mode before implementing it in n8n.

## 7. Running the Application

To run your complete Jarvis AI Assistant, ensure all components are active and communicating:

1.  **Start n8n:** Ensure your local n8n instance is running and all relevant workflows are activated. You can start n8n from your terminal:
    ```bash
    n8n start
    ```
    (Or use your Docker command if you installed via Docker).

2.  **Open Your Frontend:** Launch the `index.html` file from your `frontend_template` folder in your web browser. This will be your primary interface for interacting with Jarvis.

3.  **Ensure Internet Connectivity:** ElevenLabs requires an internet connection for speech processing and AI agent interaction.

4.  **Speak to Jarvis:** Click the microphone button on your frontend and issue a command. Observe the n8n execution logs and your PC's response.

## 8. Finished Product: Cross-Platform PC Commanders

The `finished_product` folder now contains two Python scripts to handle application launching for different operating systems:

*   **`pc_commander.py` (for Windows):** This script is designed for Windows environments and uses `start` commands to open applications.
*   **`mac_commander.py` (for macOS):** This script is designed for macOS environments and uses `open -a` commands to launch applications.

When configuring your n8n "Execute Command" node, ensure you call the correct script based on your operating system. For example:

*   **For Windows:** `python C:\Path\To\Your\Scripts\pc_commander.py {{ $json.application_name }}`
*   **For macOS:** `python /Path/To/Your/Scripts/mac_commander.py {{ $json.application_name }}`

Remember to replace `C:\Path\To\Your\Scripts\` or `/Path/To/Your/Scripts/` with the actual path where you save these Python scripts.
