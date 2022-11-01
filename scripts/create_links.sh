#!/bin/sh

echo "about to create links"

ln -sf ~/dotfiles/xinitrc     ~/.xinitrc
ln -sf ~/dotfiles/xserverrc   ~/.xserverrc

ln -sf ~/dotfiles/profile     ~/.profile
ln -sf ~/dotfiles/bashrc      ~/.bashrc

ln -sf ~/dotfiles/vimrc       ~/.vimrc

#ln -sf ~/dotfiles/npmrc       ~/.npmrc

ln -sf ~/dotfiles/zshrc       ~/.zshrc

echo "all links are created"
