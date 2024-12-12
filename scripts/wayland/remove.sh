#!/bin/bash

sudo apt-get remove sway \
 waybar \
 wl-clipboard \
 grim \
 slurp \
 pulseaudio-utils \
 blueman \
 brightnessctl

sudo usermod -r -G video ${USER}
