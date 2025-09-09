#!/bin/bash

set -eo pipefail

source ../common.sh

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
 swayidle \
 fuzzel \
 fnott \
 swaylock

# Add permission for brightnessctl
echo "Adding permissions"
sudo usermod -a -G video ${USER}

# Add symlinks for configs
echo "Creating symlinks"
mkdir -p ~/.config
create_symlink $SCRIPT_DIR/config/sway ~/.config/sway
create_symlink $SCRIPT_DIR/config/waybar ~/.config/waybar
create_symlink $SCRIPT_DIR/config/fuzzel ~/.config/fuzzel
create_symlink $SCRIPT_DIR/config/fnott ~/.config/fnott

if ! has_block_in_zshrc "wayland"; then
  add_block_to_local_zshrc "wayland" \
    "alias sst=\"/usr/libexec/xdg-desktop-portal -r & /usr/libexec/xdg-desktop-portal-wlr -r & echo 'Screen sharing started'\"" \
    "alias ssp=\"pkill -f xdg-desktop-portal; pkill -f xdg-desktop-portal-wlr; echo 'Screen sharing stopped'\""
fi

echo "Done"
