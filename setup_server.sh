#!/usr/bin/bash


# link .bashrc_server
ln -sf $PWD/.bashrc_server ~/.bashrc_server


# starship
curl -sS https://starship.rs/install.sh | sh
ln -sf $PWD/starship.toml ~/.config/starship.toml

echo "source ~/.bashrc_server" >> ~/.bashrc
source ~/.bashrc
