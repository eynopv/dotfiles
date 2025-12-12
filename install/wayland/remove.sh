#!/bin/bash

set -eo pipefail

SCRIPT_PATH="$(realpath -- "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname -- "$SCRIPT_PATH")"

source "$SCRIPT_DIR/../common.sh"

sudo apt remove \
 sway \
 waybar \
 wl-clipboard \
 grim \
 slurp \
 pulseaudio-utils \
 blueman \
 brightnessctl \
 xdg-desktop-portal \
 xdg-desktop-portal-wlr \
 xdg-desktop-portal-gtk \
 swayidle \
 fuzzel \
 fnott \
 pipewire \
 wireplumber \
 swaylock \
 lxqt-policykit

echo "Removing permissions"
sudo usermod -r -G input ${USER}
sudo usermod -r -G video ${USER}

# Remove config symlinks
echo "Removing symlinks"
remove_symlink ~/.config/sway
remove_symlink ~/.config/waybar
remove_symlink ~/.config/fuzzel
remove_symlink ~/.config/fnott
