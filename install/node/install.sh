#!/bin/bash

set -eo pipefail

SCRIPT_PATH="$(realpath -- "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname -- "$SCRIPT_PATH")"

source "$SCRIPT_DIR/../common.sh"

MODULE_NAME="node-pnpm"
VERSION=24.16.0
PNPM_HOME="${PNPM_HOME:-$HOME/.local/share/pnpm}"

if [ -d "$PNPM_HOME" ]; then
  echo "Updating pnpm"
  "$PNPM_HOME/bin/pnpm" self-update
else
  echo "Installing pnpm"
  curl -fsSL https://get.pnpm.io/install.sh | sh -
  # Remove installer’s rc edits (between # pnpm and # pnpm end)
  if [ -f "$ZSHRC_MAIN" ]; then
    # TODO: this still keeps single line
    sed -i.bak -e '/^# pnpm$/,/^# pnpm end$/d' "$ZSHRC_MAIN"
  fi
fi

upsert_block_to_zshrc "$MODULE_NAME" \
  'export PNPM_HOME="$PNPM_HOME"' \
  'export PATH="$PNPM_HOME:$PATH"' \
  'alias pn=pnpm'
export PNPM_HOME=$PNPM_HOME
export PATH="$PNPM_HOME/bin:$PATH"

# Install/select Node.js version
"$PNPM_HOME/bin/pnpm" runtime set node "$VERSION" -g
