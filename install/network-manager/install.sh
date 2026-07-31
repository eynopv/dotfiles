#!/usr/bin/env bash

set -eo pipefail

SCRIPT_PATH="$(realpath -- "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname -- "$SCRIPT_PATH")"

source "$SCRIPT_DIR/../common.sh"

sudo apt update
sudo apt install network-manager

sudo systemctl disable --now systemd-networkd
sudo systemctl enable --now NetworkManager

echo "Please restart the system"
