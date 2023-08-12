#!/bin/bash

set -eu


echo "Adding statements to ~/.bashrc"

cat <<EOF >> ~/.bashrc


# Added by dotfiles
# ----------------------------------------------------------------

export APP_GIT_REPO_SSH_URL=""
export APP_ALIAS=""

export SERVER_NAME=""

source ~/.bashrc_server.sh
EOF

source "$HOME"/.bashrc
