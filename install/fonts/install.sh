#!/bin/bash

set -euo pipefail

FONT_DIR="$HOME/.local/share/fonts"
URLS=(
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Meslo.zip"
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hack.zip"
  "https://use.fontawesome.com/releases/v7.1.0/fontawesome-free-7.1.0-desktop.zip"
)

mkdir -p "$FONT_DIR"

for URL in "${URLS[@]}"; do
  TMP=$(mktemp -d)

  echo "Downloading $URL"
  curl -L "$URL" -o "$TMP/archive.zip"

  echo "Unzipping..."
  unzip -q "$TMP/archive.zip" -d "$TMP/unpacked"

  echo "Installing..."
  find "$TMP/unpacked" -type f \( -iname "*.ttf" -o -iname "*.otf" \) \
    -exec mv -v {} "$FONT_DIR" \;

  rm -rf $TMP
done

echo ""
echo "Updating font cache..."
fc-cache -f "$FONT_DIR"

echo "All fonts installed"
