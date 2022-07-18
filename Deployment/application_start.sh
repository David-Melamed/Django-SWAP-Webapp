#!/usr/bin/env bash
echo "ApplicationStart step is starting"
/usr/local/bin/docker-compose -f /var/code/SWAP-Web/SWAP/django_swap/docker-compose.yml -d up
