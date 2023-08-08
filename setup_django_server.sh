#!/usr/bin/bash

set -eu

echo "instaling python3.11"
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install python3.11

echo "installing virtualenv"
sudo apt install python3-pip
pip3 install virtualenv

echo "installing postgres"
sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql.service