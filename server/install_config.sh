#!/bin/bash

set -eu

echo "Installing starship.toml"
ln -sf "$PWD"/config/starship.toml ~/.config/

echo "Installing .bashrc_servers.sh"
ln -sf "$PWD"/config/.bashrc_server.sh ~/

echo "source ~/.bashrc"
source "$HOME"/.bashrc