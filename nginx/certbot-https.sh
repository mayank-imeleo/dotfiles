#!/bin/bash

# automatically updates the nginx conf
sudo certbot --nginx -d "$NGINX_SERVER_NAME" -d www."$NGINX_SERVER_NAME"