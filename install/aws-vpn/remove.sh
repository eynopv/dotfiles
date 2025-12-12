#!/bin/bash

set -eo pipefail

sudo apt remove --purge awsvpnclient -y
sudo rm -f /etc/apt/sources.list.d/aws-vpn-client.list
sudo rm -f /etc/apt/trusted.gpg.d/awsvpnclient_public_key.asc
