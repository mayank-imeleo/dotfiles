#!/bin/bash

set -eu

# Setup system services
# Usage: ./server/setup.sh
# $ export GUNICORN_PROJECT_DIR="/home/ubuntu/gunicorn-project"
# $ ./gunicorn/setup.sh

GUNICORN_PROJECT_DIR=${GUNICORN_PROJECT_DIR:-/home/ubuntu/gunicorn-project}

echo "Setting Up gunicorn log files"
sudo mkdir -p /var/log/gunicorn/
sudo touch /var/log/gunicorn/access.log
sudo touch /var/log/gunicorn/error.log

sudo chown ubuntu:www-data /var/log/gunicorn
sudo chown ubuntu:www-data /var/log/gunicorn/*.log -R

echo "Setting Up nginx log files"
sudo mkdir -p /var/log/nginx/
sudo touch /var/log/nginx/access.log
sudo touch /var/log/nginx/error.log

sudo chown ubuntu:www-data /var/log/nginx
sudo chown ubuntu:www-data /var/log/nginx/*.log -R


echo "Configuring nginx"
sudo rm /etc/nginx/sites-enabled/default -f
sudo cp "$GUNICORN_PROJECT_DIR"/server/gunicorn.nginx /etc/nginx/sites-enabled/

echo "Configuring system daemons"
sudo cp "$GUNICORN_PROJECT_DIR"/server/gunicorn.socket /etc/systemd/system/
sudo cp "$GUNICORN_PROJECT_DIR"/server/gunicorn.service /etc/systemd/system/

echo "Enable system services"

sudo systemctl enable gunicorn.socket
sudo systemctl enable gunicorn.service

echo "Restarting system daemon services"
django-gunicorn-restart

#crontab server/cron

echo "Checking nginx configuration"
nginx -t

echo "Server setup complete"
