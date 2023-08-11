#!/usr/bin/bash

set -eu

sudo apt update

# basic utilities
# ------------------------------------------------------------------

sudo apt install unzip glances


# custom binaries
# ------------------------------------------------------------------

echo "Installing custom binaries"
# install binaries
./install_bin.sh


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
ln -sf $PWD/config_files/starship.toml ~/.config/starship.toml



# bashrc
# ------------------------------------------------------------------

# link .bashrc_server
ln -sf $PWD/config_files/.bashrc_server.sh ~/

# echo "source ~/.bashrc_server" >> ~/.bashrc
#source ~/.bashrc
