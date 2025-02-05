#!/bin/bash

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
sudo usermod -a -G video ${USER}
