#!/bin/bash

source ../common.sh

echo "Removing zig"

rm -rf ~/.local/share/zig
remove_block_from_local_zshrc "zig"

echo "Done"
