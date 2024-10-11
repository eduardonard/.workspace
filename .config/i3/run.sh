#!/bin/bash

# Define the full path to be added to each file
full_path="./.config/i3/"  # Change this to your actual path

# Define common and unique configuration files
common_files=("config-main" "config-bindsym" "config-colors" "config-workspaces" "config-XF86-keys" "config-moving")
work_files=("config-work")
personal_files=("config-personal")

# Color codes
RED='\033[0;31m'
RESET='\033[0m'

# Function to display menu and capture selection
select_option() {
    options=("work" "personal")
    current_selection=0

    # Hide the cursor
    tput civis

    while true; do
        clear
        echo "Please select your option:"

        # Display options with an arrow indicating the current selection
        for i in "${!options[@]}"; do
            if [ $i -eq $current_selection ]; then
                echo -e "${RED}> ${options[i]}${RESET}"  # Highlight selected option in red
            else
                echo "  ${options[i]}"
            fi
        done

        # Read user input
        read -rsn3 input  # Read a sequence of three characters for arrow keys

        case "$input" in
            $'\e[B')  # Down arrow
                ((current_selection=(current_selection+1)%2))  # Cycle down
                ;;
            $'\e[A')  # Up arrow
                ((current_selection=(current_selection-1+2)%2))  # Cycle up
                ;;
            $'\e')  # Just the escape key, ignore
                ;;
            '')  # Enter key
                break
                ;;
            *) echo "Invalid key: $input" ;;
        esac
    done

    # Show the cursor again
    tput cvvis

    # Execute the merge based on the selected option
    case "${options[current_selection]}" in
        "work")
            merge_configs "${work_files[@]}" "${common_files[@]}"
            ;;
        "personal")
            merge_configs "${personal_files[@]}" "${common_files[@]}"
            ;;
    esac
}

# Function to merge configuration files
merge_configs() {
    output_file="config"
    > "$output_file"  # Clear the output file

    # Merge common files first
    for file in "$@"; do
        if [[ -f "$full_path$file" ]]; then
            cat "$full_path$file" >> "$output_file"
            echo "" >> "$output_file"  # Add a newline for separation
            echo "" >> "$output_file"  # Add a newline for separation
        else
            echo "Warning: $full_path$file not found." >> "$output_file"
        fi
    done

    echo "Merged configurations into $output_file"
    mv "$output_file" ~/.config/i3/config
    echo "Done. Please restart i3."
}

# Main execution starts here
clear
select_option
