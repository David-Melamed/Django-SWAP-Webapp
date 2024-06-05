#!/bin/bash
# Update the package index
sudo apt-get update -y

# Install dependencies
sudo apt-get install -y software-properties-common

# Add Ansible PPA and install Ansible
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get install -y ansible

# Verify installation
ansible --version
