#!/bin/bash

set -eo pipefail

# Add Stripe CLI’s GPG key to the apt sources keyring
curl -s https://packages.stripe.dev/api/security/keypair/stripe-cli-gpg/public | gpg --dearmor | sudo tee /usr/share/keyrings/stripe.gpg

# Add CLI’s apt repository to the apt sources list
echo "deb [signed-by=/usr/share/keyrings/stripe.gpg] https://packages.stripe.dev/stripe-cli-debian-local stable main" | sudo tee -a /etc/apt/sources.list.d/stripe.list

# Update the package list
sudo apt update

# Install the CLI
sudo apt install stripe

echo "Done"
