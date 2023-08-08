#!/usr/bin/bash


# link .bashrc_server
ln -sf $PWD/.bashrc_server ~/.bashrc_server


# link starship.toml
ln -sf $PWD/starship.toml ~/.config/starship.toml

echo "source ~/.bashrc_server" >> ~/.bashrc
source ~/.bashrc