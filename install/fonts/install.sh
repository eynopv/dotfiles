#!/usr/bin/env bash

set -eo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../common.sh"

if [[ is_macos ]]; then
    FONT_DIR="$HOME/Library/Fonts"
    echo "Running on macOS. Target: $FONT_DIR"
else
    FONT_DIR="$HOME/.local/share/fonts"
    echo "Running on Linux. Target: $FONT_DIR"
fi

URLS=(
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Meslo.zip"
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hack.zip"
  "https://use.fontawesome.com/releases/v7.1.0/fontawesome-free-7.1.0-desktop.zip"
)

mkdir -p "$FONT_DIR"

for URL in "${URLS[@]}"; do
  TMP=$(mktemp -d 2>/dev/null || mktemp -d -t 'fonttmp')

  echo "Downloading $URL"
  curl -L "$URL" -o "$TMP/archive.zip"

  echo "Unzipping..."
  unzip -q "$TMP/archive.zip" -d "$TMP/unpacked"

  echo "Installing..."
  find "$TMP/unpacked" -type f \( -iname "*.ttf" -o -iname "*.otf" \) \
    -exec cp -v {} "$FONT_DIR" \;

  rm -rf "$TMP"
done

echo ""

if [[ is_macos ]]; then
    echo "Fonts installed! macOS will index them automatically."
else
    echo "Updating font cache..."
    fc-cache -f "$FONT_DIR"
    echo "All fonts installed."
fi
