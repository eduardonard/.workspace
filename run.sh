#!/bin/bash
select_first_install() {
    options=("First install" "sync")
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
        "First install")
            select_i3
            select_rofi
            select_i3blocks
            select_apps
            echo "Done"
            ;;
        "sync")
            echo "starting sync"
            selected_theme="launchpad.rasi"

            if ! command -v i3 &> /dev/null; then
                echo "i3 is not installed. Please install i3 and try again."
                exit 1
            fi
            ~/.workspace/.config/i3/run.sh

            if ! command -v nvim &> /dev/null; then
                echo "Neovim is not installed. Installing..."
                sudo apt install neovim -y
                exit 1
            fi
            mkdir -p ~/.config/nvim
            touch ~/.config/nvim/init.vim
            cp ~/.workspace/.config/nvim/init.vim ~/.config/nvim/init.vim

            if ! command -v i3blocks &> /dev/null; then
                echo "i3blocks is not installed. Please install i3blocks and try again."
                exit 1
            fi
            rm -rf ~/.config/i3blocks
            mkdir -p ~/.config/i3blocks
            cp -rf ~/.workspace/.config/i3blocks/ ~/.config/

            if ! command -v rofi &> /dev/null; then
                echo "Rofi is not installed. Please install rofi and try again."
                exit 1
            fi
            sed -i '/^theme=/s|=.*|="style-2"|' ~/.config/rofi/launchers/type-3/launcher.sh
            ;;
    esac
}

select_i3() {
    options=("Yes" "No")
    current_selection=0

    # Hide the cursor
    tput civis

    while true; do
        clear
        echo "Do you want to install i3?"

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
        "Yes")
            sudo apt install i3 -y
            sudo apt install i3lock  -y
            sudo apt install feh  -y

            
            echo "Rofi installed"
            ;;
        "No")
            echo "Skipping rofi installation"
            ;;
    esac
}


select_rofi() {
    options=("Yes" "No")
    current_selection=0

    # Hide the cursor
    tput civis

    while true; do
        clear
        echo "Do you want to install rofi?"

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
        "Yes")
            ./first-install/single/rofi.sh
            echo "Rofi installed"
            ;;
        "No")
            echo "Skipping rofi installation"
            ;;
    esac
}

select_i3blocks() {
    options=("Yes" "No")
    current_selection=0

    # Hide the cursor
    tput civis

    while true; do
        clear
        echo "Do you want to install i3blocks?"

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
        "Yes")
            ./first-install/single/i3blocks.sh
            echo "i3blocks installed"
            ;;
        "No")
            echo "Skipping i3blocks installation"
            ;;
    esac
}

select_apps() {
    options=("Base + personal" "Base + work" "Base" "None")
    current_selection=0

    # Hide the cursor
    tput civis

    while true; do
        clear
        echo "Which apps do you want to install?"

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
                ((current_selection=(current_selection+1)%4))  # Cycle down
                ;;
            $'\e[A')  # Up arrow
                ((current_selection=(current_selection-1+2)%4))  # Cycle up
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
        "Base + personal")
            ./first-install/single/useful-apts.sh
            ./first-install/single/useful-apts-personal.sh
            echo "Apps installed"
            ;;
        "Base + work")
            ./first-install/single/useful-apts.sh
            ./first-install/single/useful-apts-personal.sh
            echo "Apps installed"
            ;;
        "Base")
            ./first-install/single/useful-apts.sh
            echo "Apps installed"
            ;;
        "None")
            echo "Skipping apps installation"
            ;;
    esac
}



select_first_install