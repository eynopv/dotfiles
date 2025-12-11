#!/bin/bash

set -eo pipefail

source ../common.sh

MODULE_NAME="tmux"

sudo apt update && sudo apt install -y tmux

if ! has_block_in_zshrc "$MODULE_NAME"; then
  add_block_to_local_zshrc "$MODULE_NAME" \
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
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
