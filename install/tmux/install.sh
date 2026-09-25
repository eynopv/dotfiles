#!/usr/bin/env bash

set -eo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../common.sh"

SCRIPT_DIR=$(script_dir)
MODULE_NAME=$(module_name)

if is_linux; then
  echo "LINUX"
  tlink="https://github.com/tmux/tmux-builds/releases/download/v3.7c/tmux-3.7c-linux-x86_64.tar.gz"
  curl -L "$tmux_link" | tar -xz -C ~/.local/bin/
else
  pkg_update
  pkg_install tmux
fi

upsert_block_to_zshrc "$MODULE_NAME" \
  '$SCRIPT_DIR/main-session.sh'

create_symlink $SCRIPT_DIR/tmux.conf $HOME/.tmux.conf
