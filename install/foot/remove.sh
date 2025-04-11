#!/bin/bash

set -eo pipefail

source ../common.sh

echo "Uninstalling: foot"

sudo apt remove foot foot-themes

remove_symlink ~/.cofig/foot
