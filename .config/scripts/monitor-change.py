#!/usr/bin/python3
import subprocess

# Define display variables
HOME_PC = "eDP1"
home_pc = {
    "xrandrName": HOME_PC,
}

HOME_TV = "HDMI1"
home_tv = {
    "xrandrName": HOME_TV,
}

WORK_PC = "eDP-1"
work_pc = {
    "xrandrName": WORK_PC,
}

WORK_TV = "DP-1"
work_tv = {
    "xrandrName": WORK_TV,
}


displays = [home_tv, work_tv, home_pc, work_pc]

def run_command(command):
    result = subprocess.run(command, shell=True, text=True, capture_output=True)
    return result.stdout.strip()

def is_connected(display):
    xrandr_output = run_command("xrandr")
    return f"{display} connected" in xrandr_output

for display in displays:
    if is_connected(display["xrandrName"]):
        # run_command("xrandr " + display["xrandrConfig"])
        run_command("xrandr --output " + display["xrandrName"] + " --auto")
    else:
        run_command("xrandr --output " + display["xrandrName"] + " --off")
    run_command("~/.screenlayout/home.sh")
