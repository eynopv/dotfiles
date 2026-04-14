#!/usr/bin/env bash

set -eo pipefail

sudo apt-get update
sudo apt-get install \
  build-essential \
  fzf \
  zsh \
  curl \
  neofetch \
  htop

# set login shell to zsh
chsh -s $(which zsh)
