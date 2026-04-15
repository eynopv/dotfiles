#!/usr/bin/env bash

set -eo pipefail

SCRIPT_PATH="$(realpath -- "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname -- "$SCRIPT_PATH")"

source "$SCRIPT_DIR/../common.sh"

MODULE_NAME="neovim"
VERSION="v0.12.1"
OS=$(get_os)
ARCH=$(get_arch)
PACKAGE_NAME="nvim-$OS-$ARCH"

mkdir -p ~/.local/share/nvim

for dir in "$HOME/.local/share/nvim/$PACKAGE_NAME"; do
  if [ -d "$dir" ]; then
    echo "Removing old version: $dir"
    rm -rf "$dir"
  fi
done

curl -L "https://github.com/neovim/neovim/releases/download/$VERSION/$PACKAGE_NAME.tar.gz" | tar -xz -C ~/.local/share/nvim

if [ ! -d "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
  echo "Installing plug.vim"
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

upsert_block_to_zshrc $MODULE_NAME \
  "export PATH=\$HOME/.local/share/nvim/$PACKAGE_NAME/bin:\$PATH" \
  "export PATH=\$HOME/.local/share/lua-ls/bin:\$PATH" \
  'alias vim="nvim"' \
  'alias vi="nvim"' \
  'alias v="nvim"'

build_lua_ls_package_name() {
  local pkg_os
  local pkg_arch

  case "$(get_os)" in
    "$OS_MACOS") pkg_os="darwin" ;;
    "$OS_LINUX") pkg_os="linux" ;;
    *) die "Unsupported OS" ;;
  esac

  case "$(get_arch)" in
    "$ARCH_X86_64") pkg_arch="x64" ;;
    "$ARCH_ARM64")  pkg_arch="arm64" ;;
    *) die "Unsupported architecture" ;;
  esac

  echo "lua-language-server-$LUA_LS_VERSION-$pkg_os-$pkg_arch.tar.gz"
}

# Language servers
LUA_LS_VERSION="3.18.2"
rm -r ~/.local/share/lua-ls
mkdir -p ~/.local/share/lua-ls
curl -L "https://github.com/LuaLS/lua-language-server/releases/download/$LUA_LS_VERSION/$(build_lua_ls_package_name)" | tar -xz -C ~/.local/share/lua-ls

# Requires PNPM preinstalled
pnpm install -g typescript typescript-language-server
pnpm install -g vscode-langservers-extracted
pnpm install -g svelte-language-server
pnpm install -g @tailwindcss/language-server
pnpm install -g prettier
pnpm install -g bash-language-server

# Formatters
sudo apt install -y pgformatter
