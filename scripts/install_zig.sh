#!/bin/bash

os="linux"
arch="x86_64"
version="0.13.0"

ziglink="https://ziglang.org/download/$version/zig-$os-$arch-$version.tar.xz"
zlslink="https://builds.zigtools.org/zls-$os-$arch-$version.tar.xz"

echo "Removing old"
rm -rf ~/.local/share/zig

echo "Downloading zig"
curl -L $ziglink | tar -xJ -C ~/.local/share
mv ~/.local/share/zig{-linux-x86_64-0.13.0,}

echo "Downloading zls"
curl -L $zlslink | tar -xJ -C ~/.local/share/zig

if ! grep -Fq "# @zig start" "$ZSHRC_LOCAL"; then
  echo "Adding zig to PATH"
  echo "" >> $ZSHRC_LOCAL
  echo "# @zig start" >> $ZSHRC_LOCAL
  echo -e "export PATH=\$HOME/.local/share/zig:\$PATH" >> $ZSHRC_LOCAL
  echo "# @zig end" >> $ZSHRC_LOCAL
else
  echo "Skipping addition to PATH"
fi
