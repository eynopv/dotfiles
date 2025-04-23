#!/bin/bash

use_npm=0

while :; do
  case $1 in
    --use-npm) use_npm=1
      ;;
    *) break
  esac
  shift
done

echo "about to create links"

mkdir ~/.config
ln -sf ~/dotfiles/nvim ~/.config/nvim

if [[ $use_npm -eq 1 ]]; then
  ln -sf ~/dotfiles/npmrc       ~/.npmrc
fi;

ln -sf ~/dotfiles/zshrc        ~/.zshrc
ln -sf ~/dotfiles/tmux.conf    ~/.tmux.conf


echo "all links are created"
