#!/bin/bash

set -eo pipefail

SCRIPT_PATH="$(realpath -- "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname -- "$SCRIPT_PATH")"

source "$SCRIPT_DIR/../common.sh"

sudo apt install \
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
 wf-recorder \
 lxqt-policykit

# Add permission for brightnessctl
echo "Adding permissions"
sudo usermod -a -G input ${USER}
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
