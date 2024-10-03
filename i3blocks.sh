sudo apt-get install autoconf
git clone https://github.com/vivien/i3blocks
cd i3blocks
rm -rf .git
./autogen.sh
./configure
make
make install