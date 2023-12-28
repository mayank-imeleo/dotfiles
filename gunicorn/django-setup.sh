#!/bin/bash

set -eu

GUNICORN_PROJECT_DIR=/home/ubuntu/gunicorn-project
cd "$GUNICORN_PROJECT_DIR"

source .env

virtualenv venv -p "$PYTHON_EXECUTABLE" --clear

source venv/bin/activate

echo "installing python requirements"
pip install  git+https://github.com/mayank-m2/pyutils --force-reinstall
pip install -r "requirements/local.txt"
pip install -r "requirements/production.txt"

echo "setup django application"
./manage.py check
./manage.py migrate
./manage.py cities_light
./manage.py collectstatic --no-input





