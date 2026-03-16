#!/usr/bin/env bash

set -eo pipefail

MODULE_NAME="git-aliases"
SCRIPT_PATH="$(realpath -- "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname -- "$SCRIPT_PATH")"

source "$SCRIPT_DIR/../common.sh"

upsert_block_to_zshrc $MODULE_NAME \
  "source $SCRIPT_DIR/zshrc.git-aliases"
