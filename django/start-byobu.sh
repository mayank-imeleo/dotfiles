#!/bin/bash

set -eu

cd "$GUNICORN_PROJECT_DIR"
SESSION_NAME="django"

echo "Starting Byobu session: $SESSION_NAME"
byobu new-session -d -s "$SESSION_NAME"


# Nginx
echo "Creating Nginx Window"
byobu new-window -t "$SESSION_NAME" -n "ngnx-er-lg" \
  "sudo multitail /var/log/nginx/error.log -f"

# Gunicorn
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


echo "Byobu session $SESSION_NAME successfully started"

echo "Attach to the session with: byobu attach -t $SESSION_NAME"