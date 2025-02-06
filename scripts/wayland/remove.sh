#!/bin/bash

set -eo pipefail

echo "Uninstalling"

sudo apt-get remove sway \
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

echo "Removing permissions"
sudo usermod -r -G video ${USER}

# Remove config symlinks
echo "Removing symlinks"
rm -r ~/.config/sway
rm -r ~/.config/waybar

echo "Done"
