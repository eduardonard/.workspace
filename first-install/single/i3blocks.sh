#!/bin/bash
sudo apt-get install autoconf -y
cd ~/.workspace/.config/i3blocks || exit
./autogen.sh
./configure
make
make install
cd ~ || exit