#!/bin/bash

set -eo pipefail

# Download and install
echo "Downloading aws-cli"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip

if [ -d "/usr/local/aws-cli" ]; then
  echo "Found existing installation. Updating"
  sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
else
  echo "Installing"
  sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli
fi

# Cleanup
echo "Cleaning up"
rm awscliv2.zip
rm -r aws

echo "Done"
