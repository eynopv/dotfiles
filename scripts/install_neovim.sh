#!/bin/bash

# Install from releases:
# Download
# https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz
# Extract
# tar xzvf nvim-linux64.tar.gz
# Move nvim-linux64/bin/nvim to ~/.local/bin/nvim/bin/

sudo apt install neovim python3-neovim
# plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
