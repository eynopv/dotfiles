#!/usr/bin/env bash

set -eo pipefail

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] &&  \. "$NVM_DIR/nvm.sh"

nvm use default >/dev/null 2>&1 || true

exec "$@"
