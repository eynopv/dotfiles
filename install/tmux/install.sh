#!/usr/bin/env bash

set -eo pipefail

SCRIPT_PATH="$(realpath -- "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname -- "$SCRIPT_PATH")"

source "$SCRIPT_DIR/../common.sh"

MODULE_NAME="tmux"

pkg_update
pkg_install tmux

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


create_symlink $SCRIPT_DIR/tmux.conf ~/.tmux.conf
