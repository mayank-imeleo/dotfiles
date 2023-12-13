#!/bin/bash

echo "Installing local binary utilities"

mkdir ~/.local/bin -p

cp bin/local/* "$HOME"/.local/bin/ -v
