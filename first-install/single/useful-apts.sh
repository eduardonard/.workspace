#!/bin/bash
sudo apt install build-essential -y
sudo apt install vim  -y
sudo apt install gh  -y
sudo apt -f install gnome-terminal  -y
sudo apt install zsh  -y
sudo apt install arandr  -y
sudo apt install curl  -y
sudo apt install blueman -y
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && sudo apt update && sudo apt install -y google-chrome-stable

sudo snap install code --classic
sudo snap install nvim --classic

snap install opera
snap install firefox
snap install spotify