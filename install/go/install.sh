#!/bin/bash

set -eo pipefail

version=1.26.2

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../common.sh"

MODULE_NAME=$(module_name)

if [[ -d "$HOME/.local/share/go" ]]; then
  echo "Removing old version"
  rm -rf "$HOME/.local/share/go"
fi

echo "Downloading go"
if [[ is_macos ]]; then
  curl -L https://go.dev/dl/go${version}.darwin-arm64.tar.gz | tar -xz -C "$HOME/.local/share" || exit 1
else
  curl -L https://go.dev/dl/go${version}.linux-amd64.tar.gz | tar -xz -C "$HOME/.local/share" || exit 1
fi

echo "Installing gopls"
"$HOME/.local/share/go/bin/go" install golang.org/x/tools/gopls@latest

echo "Installing golangci-lint"
"$HOME/.local/share/go/bin/go" install github.com/nametake/golangci-lint-langserver@latest
"$HOME/.local/share/go/bin/go" install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@v2.10.1

upsert_block_to_zshrc "$MODULE_NAME" \
  "export PATH=\$HOME/.local/share/go/bin:\$PATH" \
  "export PATH=\$HOME/go/bin:\$PATH"
