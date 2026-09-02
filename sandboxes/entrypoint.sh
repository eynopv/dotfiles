#!/usr/bin/env bash

set -eo pipefail

if [[ -d "node_modules" ]]; then
  chown -R "$HOST_UID:$HOST_GID" node_modules
fi

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] &&  \. "$NVM_DIR/nvm.sh"

nvm use default >/dev/null 2>&1 || true

exec setpriv --reuid="$HOST_UID" --regid="$HOST_GID" --clear-groups "$@"
