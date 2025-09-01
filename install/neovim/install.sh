#!/bin/bash

source ../common.sh

MODULE_NAME="neovim"

echo "Installing $MODULE_NAME"

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
VERSION="v0.11.4"

mkdir -p ~/.local/share/nvim

for dir in "$HOME/.local/share/nvim"/nvim-linux*; do
  if [ -d "$dir" ]; then
    echo "Removing old version: $dir"
    rm -rf "$dir"
  fi
done

curl -L "https://github.com/neovim/neovim/releases/download/$VERSION/nvim-linux-x86_64.tar.gz" | tar -xz -C ~/.local/share/nvim

if [ ! -d "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
  echo "Installing plug.vim"
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

if ! has_block_in_zshrc $MODULE_NAME; then
  add_block_to_local_zshrc $MODULE_NAME \
    "export PATH=\$HOME/.local/share/nvim/nvim-linux-x86_64/bin:\$PATH" \
    "export PATH=\$HOME/.local/share/lua-ls/bin:\$PATH" \
    'alias vim="nvim"' \
    'alias vi="nvim"' \
    'alias v="nvim"'
fi

# Language servers
LUA_LS_VERSION="3.15.0"
rm -r ~/.local/share/lua-ls
mkdir -p ~/.local/share/lua-ls
curl -L "https://github.com/LuaLS/lua-language-server/releases/download/$LUA_LS_VERSION/lua-language-server-$LUA_LS_VERSION-linux-x64.tar.gz" | tar -xz -C ~/.local/share/lua-ls

# Requires PNPM preinstalled
pnpm install -g typescript typescript-language-server
pnpm install -g vscode-langservers-extracted
pnpm install -g @tailwindcss/language-server

# Formatters
sudo apt install -y pgformatter

echo "Done"
