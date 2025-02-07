#!/bin/bash

# Check if .env file exists
if [ ! -f .env ]; then
    echo "Error: .env file not found"
    exit 1
fi

# Load environment variables from .env file
set -a  # automatically export all variables
source .env
set +a  # disable auto-export

pushd terraform
# Run terraform init if .terraform directory doesn't exist
if [ ! -d .terraform ]; then
    echo "Running terraform init..."
    terraform init
fi

# Run terraform plan
echo "Running terraform plan..."
terraform plan
popd
