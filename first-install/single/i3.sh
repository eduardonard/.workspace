#!/bin/bash

sudo apt install i3  -y
sudo apt install i3blocks  -y
sudo apt install feh  -y

sudo apt-get install autoconf -y
cd ~/.workspace/.config/i3blocks || exit
./autogen.sh
./configure
make
make install
cd ~ || exit