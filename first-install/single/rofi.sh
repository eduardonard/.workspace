#!/usr/bin/env bash
sudo apt install rofi  -y

git clone --depth=1 https://github.com/adi1090x/rofi.git ~/.workspace/rofi-themes
cd ~/.workspace/rofi-themes
chmod +x setup.sh
./setup.sh
rm -rf .git
cd ~/.workspace