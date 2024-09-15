#!/bin/bash

echo "Removing old"
rm -rf ~/.local/share/go

echo "Downloading go"
curl -L https://go.dev/dl/go1.23.1.linux-amd64.tar.gz | tar -xz -C ~/.local/share

echo "Installing gopls"
~/.local/share/go/bin/go install golang.org/x/tools/gopls@latest

if ! grep -Fq "# Go language" "$ZSHRC_LOCAL"; then
  echo "Adding Go to PATH"
  echo "" >> $ZSHRC_LOCAL
  echo "# Go language start" >> $ZSHRC_LOCAL
  echo -e "export PATH=\$HOME/.local/share/go/bin:\$PATH" >> $ZSHRC_LOCAL
  echo -e "export PATH=\$HOME/go/bin:\$PATH" >> $ZSHRC_LOCAL
  echo "# Go language end" >> $ZSHRC_LOCAL
else
  echo "Skipping addition to PATH"
fi
