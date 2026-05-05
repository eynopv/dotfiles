#!/usr/bin/env bash

set -eo pipefail

docker run --rm \
  -e TERM=$TERM \
  -v $HOME/.config/opencode:/.config/opencode \
  -v $HOME/.local/share/opencode:/.local/share/opencode \
  opencode
  "$@"
