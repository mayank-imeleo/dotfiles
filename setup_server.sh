#!/usr/bin/bash


# link .bashrc_server
ln -sf $PWD/.bashrc_server ~/.bashrc_server
echo "source ~/.bashrc_remote" >> ~/.bashrc

# link starship.toml
ln -sf $PWD/starship.toml ~/.config/starship.toml
