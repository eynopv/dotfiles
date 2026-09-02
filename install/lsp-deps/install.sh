#!/usr/bin/env bash

set -eo pipefail

SCRIPT_PATH="$(realpath -- "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname -- "$SCRIPT_PATH")"

source "$SCRIPT_DIR/../common.sh"

build_lua_ls_link() {
  local version="3.18.2"
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

  echo "https://github.com/LuaLS/lua-language-server/releases/download/$version/lua-language-server-$version-$pkg_os-$pkg_arch.tar.gz"
}

rm -rf "$HOME/.local/share/lua-ls"
mkdir -p "$HOME/.local/share/lua-ls"
curl -L "$(build_lua_ls_link)" | tar -xz -C "$HOME/.local/share/lua-ls"

pnpm install -g \
  typescript@7.0.2 \
  typescript-language-server@6.0.0 \
  vscode-langservers-extracted@4.10.0 \
  @tailwindcss/language-server@0.16.0 \
  bash-language-server@5.6.0 \
  prettier@3.9.6 \
  sql-formatter@15.8.0
