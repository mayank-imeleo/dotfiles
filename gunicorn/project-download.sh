#!/bin/bash

set -eu

# Download the gunicorn project repo

PROJECT_DIR=/home/ubuntu/gunicorn-project
echo "Downloading git repo"
rm  $PROJECT_DIR -rf
git clone "$APP_GIT_REPO_SSH_URL" $PROJECT_DIR
cd $PROJECT_DIR
ls


