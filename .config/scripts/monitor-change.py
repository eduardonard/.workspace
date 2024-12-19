#!/usr/bin/python3
import subprocess

# Define display variables
HOME_PC = "eDP1"
home_pc = {
    "xrandrName": HOME_PC,
    "xrandrConfig": f"--output {HOME_PC} --scale 1x1 --mode 1920x1200 --pos 0x240",
}

HOME_TV = "HDMI1"
home_tv = {
    "xrandrName": HOME_TV,
    "xrandrConfig": f"--output {HOME_TV} --scale 1x1 --mode 2560x1440 --pos 2380x0",
}

WORK_PC = "eDP-1"
work_pc = {
    "xrandrName": WORK_PC,
    "xrandrConfig": f"--output {WORK_PC} --scale 0.75x0.75 --mode 3840x2400 --pos 0x900",
}

WORK_TV = "DP-1"
work_tv = {
    "xrandrName": WORK_TV,
    "xrandrConfig": f"--output {WORK_TV} --scale 1.25x1.25 --mode 3840x2160 --pos 2880x0",
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
        run_command("xrandr " + display["xrandrConfig"])
    else:
        run_command("xrandr --output " + display["xrandrName"] + " --off")
