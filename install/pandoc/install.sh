#!/usr/bin/env bash

set -eo pipefail

SCRIPT_PATH="$(realpath -- "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname -- "$SCRIPT_PATH")"

source "$SCRIPT_DIR/../common.sh"

MODULE_NAME="pandoc"

VERSION="3.9"

mkdir -p ~/.local/share/pandoc

curl -L "https://github.com/jgm/pandoc/releases/download/$VERSION/pandoc-$VERSION-linux-amd64.tar.gz" | tar -xz -C ~/.local/share/pandoc

sudo apt install weasyprint -y

if ! has_block_in_zshrc $MODULE_NAME; then
  add_block_to_local_zshrc $MODULE_NAME \
    "export PATH=\$HOME/.local/share/pandoc/pandoc-$VERSION/bin:\$PATH" \
    "alias panpdf='pandoc --pdf-engine=weasyprint'"
fi
