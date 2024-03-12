#!/bin/bash

set -eu

cd "$GUNICORN_PROJECT_DIR"
SESSION_NAME="django"

echo "Starting Byobu session: $SESSION_NAME"
byobu new-session -d -s "$SESSION_NAME"

# Nginx Access Log
echo "creating nginx access log window"
byobu new-window -t "$SESSION_NAME" -n "ngnx-ac-lg" \
  "sudo multitail /var/log/nginx/access.log -f"

# Nginx Error Log
echo "creating nginx error log window"
byobu new-window -t "$SESSION_NAME" -n "ngnx-er-lg" \
  "sudo multitail /var/log/nginx/error.log -f"

# Gunicorn Error Log
echo "creating gunicorn window"
byobu new-window -t "$SESSION_NAME" -n "gncrn-er-lg" \
  "sudo multitail /var/log/gunicorn/error.log -f"

# Gunicorn JournalCtl
echo "creating gunicorn journalctl window"
byobu new-window -t "$SESSION_NAME" -n "gncrn-jrnctl-lg" \
  "sudo journalctl -u gunicorn -f"

# Celery
echo "creating celery window"
byobu new-window -t "$SESSION_NAME" -n "clry-lg" \
  "sudo multitail /var/log/celery/worker1.log /var/log/celery/beat.log -f"

# Django
echo "creating gunicorn directory window"
byobu new-window -t "$SESSION_NAME" -n "gncrn" -c "$HOME/gunicorn-project/"

# Dotfiles
echo "creating dotfiles directory window"
byobu new-window -t "$SESSION_NAME" -n "dtfls" -c "$HOME/dotfiles/"


echo "Byobu session $SESSION_NAME successfully started"


echo "Attaching to Byobu session $SESSION_NAME"
byobu attach -t django
byobu-quiet