#!/bin/bash

sudo apt-get install zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 https://github.com/migoa/neo ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/neo
git clone --depth=1 https://github.com/rafaelsq/nuts.zsh-theme ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/nuts
chsh -s $(which zsh)
