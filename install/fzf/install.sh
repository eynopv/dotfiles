#!/usr/bin/env bash

set -eo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../common.sh"

MODULE_NAME="$(module_name)"
VERSION="0.71.0"

build_package_name() {
  local pkg_os
  local pkg_arch

  case "$(get_os)" in
    "$OS_MACOS") pkg_os="darwin" ;;
    "$OS_LINUX") pkg_os="linux" ;;
    *) die "Unsupported OS" ;;
  esac

  case "$(get_arch)" in
    "$ARCH_X86_64") pkg_arch="amd64" ;;
    "$ARCH_ARM64")  pkg_arch="arm64" ;;
    *) die "Unsupported architecture" ;;
  esac

  echo "fzf-$VERSION-"$pkg_os"_"$pkg_arch".tar.gz"
}

curl -L "https://github.com/junegunn/fzf/releases/download/v$VERSION/$(build_package_name)" | tar -xz -C ~/.local/bin

upsert_block_to_zshrc "$MODULE_NAME" \
  "source <(fzf --zsh)"
