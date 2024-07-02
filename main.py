Python
import os
import json
from datetime import datetime

# Define the configuration directory path within the container
config_dir = "/app/config"

def save_startup_data():
    """
    Saves a "Hello World" message with a timestamp to a JSON file.
    """

    config_file_path = os.path.join(config_dir, "startup_data.json")
    current_time = datetime.utcnow().isoformat()  # Use UTC for consistency
    data = {"message": "Hello World!", "timestamp": current_time}
    try:
        with open(config_file_path, "w") as f:
            json.dump(data, f, indent=4)
        print("Startup data saved successfully.")
    except OSError as e:
        print(f"Error saving startup data: {e}")

# Check if the configuration file exists to avoid overwriting on subsequent runs
if not os.path.exists(os.path.join(config_dir, "startup_data.json")):
    save_startup_data()