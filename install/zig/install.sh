#!/bin/bash

SCRIPT_PATH="$(realpath -- "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname -- "$SCRIPT_PATH")"

source "$SCRIPT_DIR/../common.sh"

MODULE_NAME="zig"

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

echo "Downloading zig"
curl -L $ziglink | tar -xJ -C ~/.local/share || exit 1
mv ~/.local/share/zig{-linux-x86_64-$version,}

echo "Downloading zls"
curl -L $zlslink | tar -xJ -C ~/.local/share/zig || exit 1

if ! has_block_in_zshrc $MODULE_NAME; then
  add_block_to_local_zshrc $MODULE_NAME \
    "export PATH=\$HOME/.local/share/zig:\$PATH"
fi
