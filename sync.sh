#!/bin/bash

selected_theme="launchpad.rasi"

if ! command -v i3 &> /dev/null; then
    echo "i3 is not installed. Please install i3 and try again."
    exit 1
fi
cp .config/i3/config ~/.config/i3/config

if ! command -v nvim &> /dev/null; then
    echo "Neovim is not installed. Please install Neovim and try again."
    exit 1
fi
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
cp .config/nvim/init.vim ~/.config/nvim/init.vim

if ! command -v i3blocks &> /dev/null; then
    echo "i3blocks is not installed. Please install i3blocks and try again."
    exit 1
fi
rm -rf ~/.config/i3blocks
mkdir -p ~/.config/i3blocks
cp -rf ~/.config/i3blocks/ ~/.config/i3blocks

if ! command -v rofi &> /dev/null; then
    echo "Rofi is not installed. Please install rofi and try again."
    exit 1
fi
sed -i '/^theme=/s|=.*|="style-2"|' ~/.config/rofi/launchers/type-3/launcher.sh
