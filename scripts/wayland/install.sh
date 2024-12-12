#!/bin/bash

sudo apt-get install sway \
 waybar \
 wl-clipboard \
 grim \
 slurp \
 pulseaudio-utils \
 blueman \
 brightnessctl

# Add permission for brightnessctl
sudo usermod -a -G video ${USER}
