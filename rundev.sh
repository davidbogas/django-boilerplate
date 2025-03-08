#!/bin/bash

docker compose up -d

python app/manage.py makemigrations
python app/manage.py migrate

python app/manage.py db_worker --queue-name '*' &
python app/manage.py tailwind start &

python app/manage.py runserver
