#!/bin/bash

source ../common.sh

os="linux"
arch="x86_64"
version="0.14.0-dev.1951+857383689"
zls_version="0.13.0"

if [[ $version == *"-dev"* ]]; then
  ziglink="https://ziglang.org/builds/zig-linux-$arch-$version.tar.xz"
else
  ziglink="https://ziglang.org/download/$version/zig-$os-$arch-$version.tar.xz"
fi

ziglink="https://ziglang.org/builds/zig-linux-$arch-$version.tar.xz"
zlslink="https://builds.zigtools.org/zls-$os-$arch-$zls_version.tar.xz"

echo "Installing zig"

echo "Downloading zig"
curl -L $ziglink | tar -xJ -C ~/.local/share || exit 1
mv ~/.local/share/zig{-linux-x86_64-$version,}

echo "Downloading zls"
curl -L $zlslink | tar -xJ -C ~/.local/share/zig || exit 1

if ! grep -Fq "# @zig start" "$ZSHRC_LOCAL"; then
  echo "Adding lines to local zshrc"
  add_block_to_local_zshrc "zig" \
    "export PATH=\$HOME/.local/share/zig:\$PATH"
fi

echo "Done"
