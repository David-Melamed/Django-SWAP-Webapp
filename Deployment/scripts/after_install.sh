#!/usr/bin/env bash
echo "AfterInstall step is starting"

if docker info >/dev/null 2>&1; then
    echo "Application is running - shutting down application containers"
    /usr/local/bin/docker-compose -f /var/code/SWAP-Web/SWAP/django_swap/docker-compose.yml down -v
    exit 0
fi



