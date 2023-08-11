#!/usr/bin/bash

set -eu



sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
echo "installing python3.10"
sudo apt-get install python3.10
echo "installing python3.11"
sudo apt-get install python3.11

echo "Installing pip"
sudo apt install python3-pip
sudo pip install --upgrade pip

echo "Installing nginx"
sudo apt-get install nginx

echo "Installing ncm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# install geospatial libraries
sudo apt-get install binutils libproj-dev gdal-bin

echo "installing virtualenv"
sudo apt install python3-pip
pip3 install virtualenv

echo "installing postgres"
sudo apt install postgis postgresql postgresql-contrib
sudo systemctl start postgresql.service
# sudo -u postgres psql

