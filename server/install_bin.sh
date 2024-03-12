#!/bin/bash

echo "Installing local binary utilities"

mkdir ~/.local/bin -p

echo "create symbolic links from ~/.local/bin to ./bin"
ln -sf  "$PWD"/bin/* "$HOME"/.local/bin

echo "remove broken symbolic links from ~/.local/bin"
find "$HOME"/.local/bin -xtype l -delete