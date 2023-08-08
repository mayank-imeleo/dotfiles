#!/usr/bin/bash


# link .bashrc_server
ln -sf $PWD/.bashrc_server ~/.bashrc_server


# Starship
# ------------------------------------------------------------------

# Install nerd-font
echo "installling nerd-font"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip
mv FiraCode.zip /tmp
unzip /tmp/FiraCode.zipunzip /tmp/FiraCode.zip -d /tmp/FiraCode
mkdir ~/.fonts -p
mv /tmp/FiraCode*.ttf ~/.fonts

echo "installling starship"
curl -s https://starship.rs/install.sh | sh

# setup starship config

ln -sf $PWD/starship.toml ~/.config/starship.toml


# bashrc
# ------------------------------------------------------------------


echo "source ~/.bashrc_server" >> ~/.bashrc
source ~/.bashrc
