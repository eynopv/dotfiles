#!/bin/bash

source ../common.sh

echo "Installing go"

echo "Downloading go"
curl -L https://go.dev/dl/go1.24.0.linux-amd64.tar.gz | tar -xz -C ~/.local/share || exit 1

echo "Installing gopls"
~/.local/share/go/bin/go install golang.org/x/tools/gopls@latest

echo "Installing golangci-lint"
~/.local/share/go/bin/go install github.com/nametake/golangci-lint-langserver@latest
~/.local/share/go/bin/go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

if ! grep -Fq "# @go start" "$ZSHRC_LOCAL"; then
  add_block_to_local_zshrc "go" \
    "export PATH=\$HOME/.local/share/go/bin:\$PATH" \
    "export PATH=\$HOME/go/bin:\$PATH"
fi

echo "Done"
