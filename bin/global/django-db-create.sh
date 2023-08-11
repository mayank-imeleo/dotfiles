#!/usr/bin/env bash

# Usage:
# sudo cp create-django-db.sh /usr/local/bin/
# sudo -u postgres create-django-db.sh mooving_django_oms

DATABASE=$1
USER=$1
PASSWORD=$1

sudo -u postgres psql <<EOF
drop database if exists $DATABASE;
create database $DATABASE;
create user $USER with login password '$PASSWORD';

grant all on database $DATABASE to $USER;
alter database $DATABASE owner to $USER;

EOF