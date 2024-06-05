#!/bin/bash

# Directory containing Ansible playbooks
PLAYBOOK_DIR="/var/app/staging/.platform/ansible/ec2-security"


# Run all Ansible playbooks in the directory
echo "Running Ansible playbooks in $PLAYBOOK_DIR..."
for playbook in "$PLAYBOOK_DIR"/*.yaml; do
    if [ -f "$playbook" ]; then
        echo "Running playbook $playbook..."
        ansible-playbook -i "localhost," "$playbook"
    fi
done

echo "All scripts and playbooks executed."
