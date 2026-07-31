#!/usr/bin/env bash

set -eo pipefail

sudo apt-get update
sudo apt-get install \
  build-essential \
  fzf \
  zsh \
  curl \
  htop \
  zip \
  unzip \
  ripgrep \
  fastfetch

# set login shell to zsh
chsh -s $(which zsh)
