#!/bin/bash

# automatically updates the nginx conf
sudo certbot --nginx -d "$NGINX_SERVER_NAME" -d www."$NGINX_SERVER_NAME"

echo "HTTPS certificate setup complete"

echo "Restart nginx service"
sudo systemctl restart nginx.service