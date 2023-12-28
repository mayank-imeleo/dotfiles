#!/usr/bin/bash

set -eu

# Python Dependencies
sudo apt-get install \
  libpq-dev libgl1 \
  -y
# certbot
sudo snap install core; sudo snap refresh core
sudo apt remove certbot
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot

sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
echo "installing python3.10"
sudo apt-get install python3.10 -y
sudo apt-get install python3.10-dev -y

echo "installing python3.11"
sudo apt-get install python3.11 -y
sudo apt-get install python3.11-dev -y

echo "Installing pip"
sudo apt install python3-pip -y
sudo pip install --upgrade pip

echo "Installing virtualenv"
pip3 install virtualenv

echo "Installing nginx"
sudo apt-get install nginx

echo "Installing ncm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# install geospatial libraries
sudo apt-get install binutils libproj-dev gdal-bin -y

echo "installing virtualenv"
sudo apt install python3-pip -y
pip3 install virtualenv

echo "installing postgres"
sudo apt install postgis postgresql postgresql-contrib -y
sudo systemctl start postgresql.service -y
# sudo -u postgres psql

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash