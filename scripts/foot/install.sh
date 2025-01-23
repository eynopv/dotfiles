#!/bin/bash

set -eo pipefail

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

sudo apt install foot foot-themes

mkdir -p ~/.config/foot
ln -sf $SCRIPT_DIR/foot.ini ~/.config/foot/foot.ini
