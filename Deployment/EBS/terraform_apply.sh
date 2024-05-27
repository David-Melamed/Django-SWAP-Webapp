#!/bin/bash

# Generate a filename with date and time
filename="terraform_state_$(date +%Y-%m-%d_%H-%M-%S).tfstate"
output_path="/tmp/$filename"

# Run Terraform apply and specify the output path for the state file
terraform apply -state-out="$output_path"

# Check if Terraform apply was successful
if [ $? -eq 0 ]; then
    echo "Terraform apply successful."
    echo "State file has been written to: $output_path"
else
    echo "Terraform apply failed."
fi

