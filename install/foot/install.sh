#!/bin/bash

set -eo pipefail

source ../common.sh

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

echo "Installing: foot"

sudo apt install foot foot-themes

mkdir -p ~/.config
create_symlink $SCRIPT_DIR/config ~/.config/foot
