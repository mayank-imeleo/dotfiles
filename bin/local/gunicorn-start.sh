#!/bin/bash

set -eu

# https://docs.gunicorn.org/en/stable/settings.html

GUNICORN_PROJECT_DIR="/home/ubuntu/gunicorn-project"

/home/ubuntu/gunicorn-project/venv/bin/gunicorn \
  --access-logfile /var/log/gunicorn/access.log \
  --error-logfile /var/log/gunicorn/error.log \
  --log-level debug \
  --workers 4 \
  --bind unix:/tmp/gunicorn.sock \
  --timeout 75 \
  --chdir "$GUNICORN_PROJECT_DIR" \
  config.wsgi:application
