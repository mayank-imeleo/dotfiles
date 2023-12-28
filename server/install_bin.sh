#!/bin/bash

echo "Installing local binary utilities"

mkdir ~/.local/bin -p

cp bin/* "$HOME"/.local/bin/ -v
