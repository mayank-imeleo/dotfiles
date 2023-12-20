#!/bin/bash

set -eu

# https://docs.gunicorn.org/en/stable/settings.html

GUNICORN_PROJECT_DIR="/home/ubuntu/gunicorn-project"

#  --bind unix:/tmp/gunicorn.sock \

/home/ubuntu/gunicorn-project/venv/bin/gunicorn \
  --user ubuntu \
  --group www-data \
  --access-logfile /var/log/gunicorn/access.log \
  --error-logfile /var/log/gunicorn/error.log \
  --log-level debug \
  --workers 4 \
  --bind 127.0.0.1:8080 \
  --timeout 75 \
  --chdir "$GUNICORN_PROJECT_DIR" \
  config.wsgi:application
