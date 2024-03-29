#!/bin/bash

set -eu

GUNICORN_PROJECT_DIR=/home/ubuntu/gunicorn-project
cd "$GUNICORN_PROJECT_DIR"

source .env

django-db-create "$DATABASE_NAME"

virtualenv venv -p "$PYTHON_EXECUTABLE" --clear

source venv/bin/activate

echo "installing python requirements"
pip install  git+ssh://git@github.com/mayank-imeleo/pyutils --force-reinstall
pip install -r "requirements/local.txt"
pip install -r "requirements/production.txt"

echo "setup django application"

./manage.py migrate
./manage.py cities_light
./manage.py collectstatic --no-input
./manage.py check





