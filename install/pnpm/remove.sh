#!/bin/bash

set -eo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../common.sh"

MODULE_NAME=$(module_name)

rm -rf "$PNPM_HOME"

remove_block_from_local_zshrc "$(module_name)" \
  "export PNPM_HOME=\"$PNPM_HOME\"" \
  'export PATH="$PNPM_HOME:$PATH"' \
  'alias pn=pnpm'
