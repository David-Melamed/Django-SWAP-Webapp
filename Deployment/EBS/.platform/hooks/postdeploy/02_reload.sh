#!/bin/bash

# Log function with timestamp
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a /var/log/nginx_reload.log
}

# Attempt to reload nginx
log "Attempting to reload nginx..."
if sudo systemctl reload nginx; then
    log "nginx reloaded successfully."
else
    log "ERROR: Failed to reload nginx. Check nginx configuration for errors."
    exit 1
fi

log "Script execution completed."
