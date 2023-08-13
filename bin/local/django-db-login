#!/usr/bin/env bash

# Usage:
# sudo cp create-django-db.sh /usr/local/bin/
# sudo -u postgres create-django-db.sh mooving_django_oms

DATABASE=$1
USER=$1


psql -h localhost -U "$DATABASE" -d "$DATABASE"

