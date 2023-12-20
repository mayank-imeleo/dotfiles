#!/bin/bash

set -eu

source .env

virtualenv venv -p "$PYTHON_EXECUTABLE" --clear

source venv/bin/activate

echo "installing python requirements"
pip install -r "requirements/local.txt"
pip install -r "requirements/production.txt"

echo "setup django application"
./manage.py check
./manage.py migrate
./manage.py cities_light
./manage.py collectstatic --no-input





