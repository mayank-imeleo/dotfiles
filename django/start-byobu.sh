#!/bin/bash

set -eu

cd "$GUNICORN_PROJECT_DIR"
SESSION_NAME="django"

byobu new-session -d -s "$SESSION_NAME"


# Nginx
byobu new-window -t "$SESSION_NAME" -n "ngnx-er-lg" \
  "sudo multitail /var/log/nginx/error.log -f"

# Gunicorn
byobu new-window -t "$SESSION_NAME" -n "gncrn-er-lg" \
  "sudo multitail /var/log/gunicorn/error.log -f"

# Gunicorn JournalCtl
byobu new-window -t "$SESSION_NAME" -n "gncrn-jrnctl-lg" \
  "sudo journalctl -u gunicorn -f"

# Celery
byobu new-window -t "$SESSION_NAME" -n "clry-lg" \
  "sudo multitail /var/log/celery/worker1.log /var/log/celery/beat.log -f"