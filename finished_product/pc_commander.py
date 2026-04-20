import sys
import subprocess
import os

def open_application(app_name):
    app_name = app_name.lower()
    if "steam" in app_name:
        print("Opening Steam...")
        subprocess.Popen(["start", "steam://open/main"], shell=True)
    elif "obs" in app_name:
        print("Opening OBS Studio...")
        # Adjust this path to your OBS installation directory
        obs_path = "C:\\Program Files\\obs-studio\\bin\\64bit\\obs64.exe"
        if os.path.exists(obs_path):
            subprocess.Popen([obs_path])
        else:
            print(f"OBS not found at {obs_path}. Please adjust the path in pc_commander.py")
    elif "chrome" in app_name or "browser" in app_name:
        print("Opening Chrome...")
        subprocess.Popen(["start", "chrome"], shell=True)
    else:
        print(f"Unknown application: {app_name}")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        app_to_open = sys.argv[1]
        open_application(app_to_open)
    else:
        print("Usage: python pc_commander.py <application_name>")
