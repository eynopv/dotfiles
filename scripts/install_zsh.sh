#!/bin/bash

exec sudo apt-get install zsh
exec git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
exec git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
exec git clone --depth=1 https://github.com/migoa/neo ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/neo
exec git clone --depth=1 https://github.com/rafaelsq/nuts.zsh-theme ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/nuts
