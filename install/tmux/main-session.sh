#!/usr/bin/env bash

set -eo pipefail

tmux_session_name="main"
if ! tmux has-session -t "$tmux_session_name" 2>/dev/null; then 
  tmux -u new-session -d -s "$tmux_session_name" -n "dev"

  tmux split-window -h -l 65% -t "$tmux_session_name:0"
  tmux split-window -v -t "$tmux_session_name:0.0"

  tmux new-window -t "$tmux_session_name:7" -n "agent"

  tmux new-window -t "$tmux_session_name:9" -n "notes" -c "$HOME/notes"

  tmux select-window -t "$tmux_session_name:0"
  tmux select-pane -t "$tmux_session_name:0.2"

  tmux -u attach-session -t "$tmux_session_name"
fi
