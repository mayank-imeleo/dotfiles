#!/usr/bin/bash

set -eu

./server/update_repository.sh

# ==================================================================
# OPERATING SYSTEM

mkdir -p "$HOME"/.config

# Python Dependencies
sudo apt-get install \
  libpq-dev libgl1 \
  unzip glances hstr autojump figlet nnn net-tools \
  lolcat multitail \
  -y

# ==================================================================
# PYTHON


echo "installing python3.10"
sudo apt-get install python3.10 -y
sudo apt-get install python3.10-dev -y

echo "installing python3.11"
sudo apt-get install python3.11 -y
sudo apt-get install python3.11-dev -y

echo "Installing pip"
sudo apt install python3-pip -y
sudo pip install --upgrade pip

echo "installing virtualenv"
sudo apt install python3-pip -y
pip3 install virtualenv


# ==================================================================
# NGINX

echo "Installing virtualenv"
pip3 install virtualenv

echo "Installing nginx"
sudo apt-get install nginx

# Install GoAccess
sudo apt-get install goaccess -y

# certbot
sudo snap install core; sudo snap refresh core
sudo apt remove certbot
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot


# ==================================================================
# POSTGRES

# install geospatial libraries
sudo apt-get install binutils libproj-dev gdal-bin -y


echo "installing postgres"
sudo apt install postgis postgresql postgresql-contrib -y
sudo systemctl start postgresql.service -y
# sudo -u postgres psql

# ==================================================================
# NODE

echo "Installing nvm"
git clone https://github.com/nvm-sh/nvm.git /tmp/nvm
bash /tmp/nvm/install.sh

# ==================================================================
# OTHERS

echo "Installing custom binaries"
# install binaries
./server/install_bin.sh

# Install nerd-font
echo "installing nerd-font"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip
mv FiraCode.zip /tmp
unzip /tmp/FiraCode.zip -d /tmp/FiraCode
mkdir ~/.fonts -p
mv /tmp/FiraCode/*.ttf ~/.fonts

echo "installing starship"
curl -s https://starship.rs/install.sh | sh
