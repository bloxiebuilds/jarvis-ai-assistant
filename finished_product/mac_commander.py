import sys
import subprocess
import os

def open_application_mac(app_name):
    app_name = app_name.lower()
    if "steam" in app_name:
        print("Opening Steam...")
        subprocess.Popen(["open", "-a", "Steam"])
    elif "obs" in app_name:
        print("Opening OBS Studio...")
        subprocess.Popen(["open", "-a", "OBS Studio"])
    elif "chrome" in app_name or "browser" in app_name:
        print("Opening Google Chrome...")
        subprocess.Popen(["open", "-a", "Google Chrome"])
    else:
        print(f"Unknown application: {app_name}")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        app_to_open = sys.argv[1]
        open_application_mac(app_to_open)
    else:
        print("Usage: python mac_commander.py <application_name>")
