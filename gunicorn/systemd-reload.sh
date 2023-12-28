#!/bin/bash

set -eu

sudo adduser ubuntu www-data
sudo adduser www-data ubuntu

sudo chown ubuntu:www-data /run

echo "Configuring system daemons"
sudo cp "$PWD"/gunicorn/gunicorn.socket /etc/systemd/system/
sudo cp "$PWD"/gunicorn/gunicorn.service /etc/systemd/system/

django-gunicorn-restart