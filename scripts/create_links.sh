#!/bin/bash

use_x=0
use_npm=0

while :; do
  case $1 in
    --use-x) use_x=1
      ;;
    --use-npm) use_npm=1
      ;;
    *) break
  esac
  shift
done

echo "about to create links"

if [[ $use_x -eq 1 ]]; then
  ln -sf ~/dotfiles/xinitrc     ~/.xinitrc
  ln -sf ~/dotfiles/xserverrc   ~/.xserverrc
fi

#ln -sf ~/dotfiles/profile     ~/.profile
#ln -sf ~/dotfiles/bashrc      ~/.bashrc

ln -sf ~/dotfiles/nvim ~/.config

if [[ $use_npm -eq 1 ]]; then
  ln -sf ~/dotfiles/npmrc       ~/.npmrc
fi;

ln -sf ~/dotfiles/zshrc       ~/.zshrc
ln -sf ~/dotfiles/p10k.zsh    ~/.p10k.zsh

echo "all links are created"
