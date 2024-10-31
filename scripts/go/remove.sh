#!/bin/bash

source ../common.sh

echo "Removing go"

rm -rf ~/.local/share/go
remove_block_from_local_zshrc "go"

echo "Done"
