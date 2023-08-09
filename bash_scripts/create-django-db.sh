#!/usr/bin/env bash

# Usage:
# $ ./create-django-db.sh sar_ev_oms

DATABASE=$1
USER=$1
PASSWORD=$1

psql -h localhost -d mayank -U mayank <<EOF
drop database if exists $DATABASE;
create database $DATABASE;
create user $USER with login password '$PASSWORD';
grant all on database $DATABASE to $USER;
alter database $DATABASE owner to $USER;
EOF