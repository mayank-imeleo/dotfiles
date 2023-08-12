#!/bin/bash

set -eu

./server/install_config.sh

echo "Installing .bashrc_desktop.sh"
ln -sf "$PWD"/config/.bashrc_desktop.sh ~/
