#!/usr/bin/env bash

set -eo pipefail

SCRIPT_PATH="$(realpath -- "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname -- "$SCRIPT_PATH")"

source "$SCRIPT_DIR/../common.sh"

MODULE_NAME="neovim"
VERSION="v0.12.5"
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

mkdir -p ~/.config
create_symlink $SCRIPT_DIR/nvim ~/.config/nvim

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
