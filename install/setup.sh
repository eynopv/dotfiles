#!/bin/bash

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

# manual plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z ~/.zsh/zsh-z
