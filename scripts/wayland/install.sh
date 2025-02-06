#!/bin/bash

set -eo pipefail

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

echo "Installing"

sudo apt-get install sway \
 waybar \
 wl-clipboard \
 grim \
 slurp \
 pulseaudio-utils \
 blueman \
 brightnessctl \
 xdg-desktop-portal \
 xdg-desktop-portal-wlr \
 swayidle

# Add permission for brightnessctl
echo "Adding permissions"
sudo usermod -a -G video ${USER}

# Add symlinks for configs
echo "Creating symlinks"
mkdir -p ~/.config
ln -sf $SCRIPT_DIR/config/sway ~/.config/sway
ln -sf $SCRIPT_DIR/config/waybar ~/.config/waybar

echo "Done"
