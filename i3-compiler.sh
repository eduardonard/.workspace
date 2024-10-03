cp .config/i3/config ~/.config/i3/config

mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
cp .config/nvim/init.vim ~/.config/nvim/init.vim

rm -rf ~/.config/i3blocks
cp -rf .config/i3blocks/ ~/.config/i3blocks
