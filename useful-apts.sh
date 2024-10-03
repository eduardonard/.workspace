sudo apt install build-essential
sudo apt install i3
sudo apt install vim
sudo apt install gh
sudo apt install feh
sudo apt -f install gnome-terminal
sudo apt install zsh
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && sudo apt update && sudo apt install -y google-chrome-stable

sudo snap install code --classic
sudo snap install nvim --classic

snap install discord
snap install firefox
snap install notion-snap-reborn
snap install notion-calendar-snap
snap install spotify
snap install whatsapp-for-linux

gh login