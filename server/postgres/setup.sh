#!/bin/bash

set -eu
source "$HOME"/.env

figlet PostgresSQL

echo "Setting Up PostgresSQL...."
echo "Postgres version installed is $PG_VERSION"

PG_CONF_DIR=/etc/postgresql/"$PG_VERSION"/main

function _cp {
  # check if backup already exists
  if [ ! -f "$PG_CONF_DIR"/"$1".backup ]; then
    # create a backup if it doesn't exist
    echo "Creating a backup of $1"
    sudo -u postgres cp "$PG_CONF_DIR"/"$1" "$PG_CONF_DIR"/"$1".backup -v
  fi
  # copy pg config file
  echo "Copying $1"
  sudo -u postgres cp -v "$PWD"/server/postgres/"$1" "$PG_CONF_DIR"/"$1"
}

_cp pg_hba.conf

