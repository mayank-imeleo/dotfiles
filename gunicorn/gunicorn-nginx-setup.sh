#!/bin/bash

set -eu


echo "Setting Up gunicorn log files"
sudo mkdir -p /var/log/gunicorn/
sudo touch /var/log/gunicorn/access.log
sudo touch /var/log/gunicorn/error.log

# todo: Remove if not needed
# sudo adduser ubuntu www-data
# sudo adduser www-data ubuntu

sudo chown ubuntu:www-data /var/log/gunicorn
sudo chown ubuntu:www-data /var/log/gunicorn/*.log -R

echo "Setting Up nginx log files"
sudo mkdir -p /var/log/nginx/
sudo touch /var/log/nginx/access.log
sudo touch /var/log/nginx/error.log

sudo chown ubuntu:www-data /var/log/nginx
sudo chown ubuntu:www-data /var/log/nginx/*.log -R

echo "Setting /var/www/html/"
sudo mkdir -p /var/www/html/
sudo chown ubuntu:www-data /var/www/ -R

echo "Configuring nginx"
sudo rm /etc/nginx/sites-enabled/default -f
sudo cp "$PWD"/gunicorn/gunicorn.nginx /etc/nginx/sites-enabled/

echo "Configuring system daemons"
"$PWD"/gunicorn/systemd-reload.sh

echo "Restarting system daemon services"
django-gunicorn-restart

#crontab server/cron

echo "Checking nginx configuration"
sudo nginx -t

echo "Server setup complete"
