#!/bin/bash

set -eu

./server/install_config.sh

echo "Copying .bashrc_desktop.sh"
cp  "$PWD"/config/.bashrc_desktop.sh ~/ -v

echo "source ~/.bashrc"
source "$HOME"/.bashrc

echo "Successfully install configuration files for desktop environment"