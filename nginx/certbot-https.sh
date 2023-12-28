#!/bin/bash

sey -eu

source "$GUNICORN_PROJECT_DIR"/.env

# automatically updates the nginx conf
sudo certbot --nginx -d "$NGINX_SERVER_NAME" -d www."$NGINX_SERVER_NAME"

echo "HTTPS certificate setup complete"

echo "Restart nginx service"
sudo systemctl restart nginx.service