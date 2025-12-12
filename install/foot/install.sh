#!/bin/bash

set -eo pipefail

SCRIPT_PATH="$(realpath -- "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname -- "$SCRIPT_PATH")"

source "$SCRIPT_DIR/../common.sh"

sudo apt install foot foot-themes

mkdir -p ~/.config
create_symlink $SCRIPT_DIR/config ~/.config/foot
