#!/bin/bash

sudo apt-get update
sudo apt-get install build-essential
sudo apt-get install fzf
sudo apt-get install zsh

# set login shell to zsh
chsh -s $(which zsh)

# zsh plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh themes
git clone --depth=1 https://github.com/migoa/neo ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/neo
git clone --depth=1 https://github.com/rafaelsq/nuts.zsh-theme ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/nuts
