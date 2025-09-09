#!/bin/bash

set -eo pipefail

source ../common.sh

MODULE_NAME="node-pnpm"
VERSION=22.17.0
PNPM_HOME="${PNPM_HOME:-$HOME/.local/share/pnpm}"

if [ -d "$PNPM_HOME" ]; then
  echo "Updating pnpm"
  "$PNPM_HOME/pnpm" self-update
else
  echo "Installing pnpm"
  curl -fsSL https://get.pnpm.io/install.sh | sh -
  # Remove installer’s rc edits (between # pnpm and # pnpm end)
  if [ -f "$ZSHRC_MAIN" ]; then
    # TODO: this still keeps single line
    sed -i.bak -e '/^# pnpm$/,/^# pnpm end$/d' "$ZSHRC_MAIN"
  fi
fi

if ! has_block_in_zshrc "$MODULE_NAME"; then
  add_block_to_local_zshrc "$MODULE_NAME" \
    'export PNPM_HOME="$HOME/.local/share/pnpm"' \
    'export PATH="$PNPM_HOME:$PATH"'
  export PNPM_HOME="$HOME/.local/share/pnpm"
  export PATH="$PNPM_HOME:$PATH"
fi

# Install/select Node.js version
"$PNPM_HOME/pnpm" env use --global "$VERSION"

echo "Done"
