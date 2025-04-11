#!/bin/bash

source ../common.sh

echo "Installing go"

if [ -d "$HOME/.local/share/go" ]; then
  echo "Removing old version"
  rm -rf "$HOME/.local/share/go"
fi

echo "Downloading go"
curl -L https://go.dev/dl/go1.24.0.linux-amd64.tar.gz | tar -xz -C "$HOME/.local/share" || exit 1

echo "Installing gopls"
"$HOME/.local/share/go/bin/go" install golang.org/x/tools/gopls@latest

echo "Installing golangci-lint"
"$HOME/.local/share/go/bin/go" install github.com/nametake/golangci-lint-langserver@latest
"$HOME/.local/share/go/bin/go" install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

if ! grep -Fq "# @go start" "$ZSHRC_LOCAL"; then
  add_block_to_local_zshrc "go" \
    "export PATH=\$HOME/.local/share/go/bin:\$PATH" \
    "export PATH=\$HOME/go/bin:\$PATH"
fi

echo "Done"
