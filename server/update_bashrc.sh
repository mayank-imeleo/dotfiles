#!/bin/bash

set -eu


echo "Adding statements to ~/.bashrc"

cat <<EOF >> ~/.bashrc


# Added by dotfiles
# ----------------------------------------------------------------

source ~/.bashrc_server.sh
EOF

source "$HOME"/.bashrc
