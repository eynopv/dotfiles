#!/usr/bin/env bash

set -eo pipefail

tmux_session_name="main"
if ! tmux has-session -t "$tmux_session_name" 2>/dev/null; then 
  tmux -u new-session -d -s "$tmux_session_name" -n "dev"

  tmux split-window -t "$tmux_session_name:0" -h -l 65%
  tmux split-window -v "$tmux_session_name:0" -t 0

  tmux new-window -t "$tmux_session_name:7" -n "agent"

  tmux new-window -t "$tmux_session_name:9" -n "notes" -c "~/notes"

  tmux select-window -t "$tmux_session_name:0"
  tmux select-pane -t 2

  tmux -u attack-session -t "$tmux_session_name"
fi
