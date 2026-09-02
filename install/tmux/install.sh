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
  'if [[ -z "$TMUX" ]]; then' \
  ' tmux_session_name="main"' \
  ' if ! tmux has-session -t $tmux_session_name 2>/dev/null; then' \
  '   tmux -u new-session -d -s $tmux_session_name -n "dev" \; \' \
  '     split-window -h -l 65% \; \' \
  '     split-window -v -t 0 \; \' \
  '     select-pane -t 2' \
  '   tmux -u attach-session -t $tmux_session_name' \
  ' fi' \
  'fi'

create_symlink $SCRIPT_DIR/tmux.conf $HOME/.tmux.conf
