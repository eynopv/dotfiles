#!/bin/bash

set -eo pipefail

source ../common.sh

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
 swayidle \
 fuzzel \
 fnott \
 swaylock

echo "Removing permissions"
sudo usermod -r -G video ${USER}

# Remove config symlinks
echo "Removing symlinks"
remove_symlink ~/.config/sway
remove_symlink ~/.config/waybar
remove_symlink ~/.config/fuzzel
remove_symlink ~/.config/fnott

echo "Done"
