#!/usr/bin/python3
import subprocess
import re

# Command utility function
def run_command(command):
    """Executes a shell command and returns the trimmed output."""
    result = subprocess.run(command, shell=True, text=True, capture_output=True)
    return result.stdout.strip()

# Retrieve connected displays from xrandr
def get_displays():
    """Fetches display names and their connection status from xrandr."""
    xrandr_output = run_command("xrandr")
    displays = []
    for line in xrandr_output.splitlines():
        match = re.match(r"^(\S+) connected", line)
        if match:
            displays.append({"name": match.group(1), "connected": True})
        match = re.match(r"^(\S+) disconnected", line)
        if match:
            displays.append({"name": match.group(1), "connected": False})
    return displays

# Configure displays
def configure_displays(displays, layout_script="~/.screenlayout/home.sh"):
    """Configures the displays based on their connection status."""
    for display in displays:
        display_name = display["name"]
        if display["connected"]:
            run_command(f"xrandr --output {display_name} --auto")
            run_command(f"xrandr --output {display_name} --auto")
            run_command(f"xrandr --output {display_name} --auto")
        else:
            run_command(f"xrandr --output {display_name} --off")
            run_command(f"xrandr --output {display_name} --off")
            run_command(f"xrandr --output {display_name} --off")


    # Run additional layout script
    run_command(layout_script)

if __name__ == "__main__":
    displays = get_displays()
    configure_displays(displays)
