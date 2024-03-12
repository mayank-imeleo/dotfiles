#!/bin/bash

set -eu

cd "$GUNICORN_PROJECT_DIR"
SESSION_NAME="django"

echo "Starting Byobu session: $SESSION_NAME"
byobu new-session -d -s "$SESSION_NAME"

# Nginx Access Log
echo "Creating Nginx Access Log Window"
byobu new-window -t "$SESSION_NAME" -n "ngnx-ac-lg" \
  "sudo multitail /var/log/nginx/access.log -f"

# Nginx Error Log
echo "Creating Nginx Error Log Window"
byobu new-window -t "$SESSION_NAME" -n "ngnx-er-lg" \
  "sudo multitail /var/log/nginx/error.log -f"

# Gunicorn Error Log
echo "Creating Gunicorn Window"
byobu new-window -t "$SESSION_NAME" -n "gncrn-er-lg" \
  "sudo multitail /var/log/gunicorn/error.log -f"

# Gunicorn JournalCtl
echo "Creating Gunicorn JournalCtl Window"
byobu new-window -t "$SESSION_NAME" -n "gncrn-jrnctl-lg" \
  "sudo journalctl -u gunicorn -f"

# Celery
echo "Creating Celery Window"
byobu new-window -t "$SESSION_NAME" -n "clry-lg" \
  "sudo multitail /var/log/celery/worker1.log /var/log/celery/beat.log -f"

# Django
echo "Creating Django Window"
byobu new-window -t "$SESSION_NAME" -n "djg" \
  "cd $GUNICORN_PROJECT_DIR && ls -la"

# Dotfiles
echo "Creating Dotfiles Window"
byobu new-window -t "$SESSION_NAME" -n "dtfls" \
  "cd $HOME/dotfiles && ls -la"

echo "Byobu session $SESSION_NAME successfully started"

echo "Attaching to Byobu session $SESSION_NAME"

byobu attach -t django