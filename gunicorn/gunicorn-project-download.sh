#!/bin/bash

set -eu

#source .env

echo "Downloading git repo"
rm  /tmp/gunicorn-project -rf
git clone "$GIT_REPO_SSH_URL" /tmp/gunicorn-project

echo "Copying git git repo to /var/www/html"
sudo mkdir /var/www/html -p
sudo mv /tmp/gunicorn-project /var/www/html

cd /var/www/html/gunicorn-project
ls

#
#cd gunicorn
#ls