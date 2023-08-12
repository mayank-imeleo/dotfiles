#!/bin/bash

set -eu

./server/update_bashrc.sh

cat <<EOF >> ~/.bashrc
source ~/.bashrc_desktop.sh
EOF