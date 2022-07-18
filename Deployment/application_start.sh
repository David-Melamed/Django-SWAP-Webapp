#!/usr/bin/env bash
echo "ApplicationStart step is starting"

echo "Docker-compose build"
/usr/local/bin/docker-compose -f /var/code/SWAP-Web/SWAP/django_swap/docker-compose.yml build

echo "Docker-compose up"
/usr/local/bin/docker-compose -f /var/code/SWAP-Web/SWAP/django_swap/docker-compose.yml -d up
