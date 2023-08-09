#!/usr/bin/bash

set -eu

sudo apt install unzip

# link .bashrc_server
ln -sf $PWD/config_files/.bashrc_server.sh ~/

# copy bin scrips
#echo "copy local bin scripts"
#cp ./bin/local/* ~/.local/bin/ -ruv
echo "copy global bin scripts"
sudo cp ./bin/global/* /usr/local/bin/ -ruv

# direnv
# ------------------------------------------------------------------

sudo apt install direnv

# hstr
# ------------------------------------------------------------------
echo "install hstr"
sudo apt install hstr

# autojump
# ------------------------------------------------------------------

echo "install autojump"
sudo apt install autojump

# Starship
# ------------------------------------------------------------------

# Install nerd-font
echo "installling nerd-font"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip
mv FiraCode.zip /tmp
unzip /tmp/FiraCode.zip -d /tmp/FiraCode
mkdir ~/.fonts -p
mv /tmp/FiraCode/*.ttf ~/.fonts

echo "installling starship"
curl -s https://starship.rs/install.sh | sh

# setup starship config

ln -sf $PWD/starship.toml ~/.config/starship.toml


# bashrc
# ------------------------------------------------------------------


# echo "source ~/.bashrc_server" >> ~/.bashrc
#source ~/.bashrc
