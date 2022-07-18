#!/usr/bin/env bash
echo "AfterInstall step is starting"

if docker info >/dev/null 2>&1; then
    echo "Application is running - ready to shut down"
    /usr/local/bin/docker-compose -f /var/code/SWAP-Web/SWAP/django_swap/docker-compose.yml kill
    exit 1
fi



