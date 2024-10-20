sudo apt-get install autoconf
cd ~/.workspace/.config/i3blocks
./autogen.sh
./configure
make
make install
cd ~