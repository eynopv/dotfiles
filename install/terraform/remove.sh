#!/bin/bash

set -eo pipefail

# Remove hashicorp keyring
sudo rm /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Remove hashicorp repository entry
sudo rm /etc/apt/sources.list.d/hashicorp.list

# Uninstall Terraform
sudo apt-get remove --purge terraform-ls -y
sudo apt-get remove --purge terraform -y

# Update package lists
sudo apt-get update
