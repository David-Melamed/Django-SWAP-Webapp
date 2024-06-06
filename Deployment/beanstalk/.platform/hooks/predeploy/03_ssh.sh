#!/bin/bash

# Define paths for the keys
USER="devops_user"
LOCAL_KEY_PATH="$HOME/.ssh/authorized_keys"  # The authorized_keys file path
TEMP_KEY_PATH="/var/app/staging/.platform/ssh/id_rsa.pub"  # Temporary public key path

# Check if the temporary public key exists
if [ ! -f "$TEMP_KEY_PATH" ]; then
    echo "My own public key does not exist: $TEMP_KEY_PATH"
    exit 1
fi

# Ensure the .ssh directory exists and has the right permissions
mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

# Ensure the authorized_keys file exists and has the right permissions
if [ ! -f "$LOCAL_KEY_PATH" ]; then
    sudo -u $USER touch "$LOCAL_KEY_PATH"
fi
sudo chown $USER:$USER "$LOCAL_KEY_PATH"
sudo chmod 600 "$LOCAL_KEY_PATH"

# Append the public key from the temporary location to the authorized_keys file
sudo -u $USER bash -c "cat $TEMP_KEY_PATH >> $LOCAL_KEY_PATH"

# Verify the key was copied successfully
if grep -qxF -f "$TEMP_KEY_PATH" "$LOCAL_KEY_PATH"; then
    echo "SSH public key deployment completed, you are now able to connect to the server via SSH."
    # Optionally, clean up the temporary file
    rm "$TEMP_KEY_PATH"
else
    echo "Failed to deploy the SSH public key."
    exit 1
fi
