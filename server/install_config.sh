#!/bin/bash

set -eu

echo "Copying starship.toml"
cp  "$PWD"/config/starship.toml ~/.config/ -v

#echo "Copying .env to $HOME/.env"
#cp "$PWD"/config/.env "$HOME"/.env

echo "Copying .bashrc_servers.sh"
cp "$PWD"/config/.bashrc_server.sh ~/ -v

cat <<EOF >> ~/.bashrc
source ~/.bashrc_server.sh
EOF

echo "source ~/.bashrc"
source "$HOME"/.bashrc


echo "Successfully install configuration files for server environment"