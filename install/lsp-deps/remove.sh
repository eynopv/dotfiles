#!/usr/bin/env bash

set -eo pipefail

rm -rf "$HOME/.local/share/lua-ls"

pnpm remove -g \
  typescript \
  typescript-language-server \
  vscode-langservers-extracted \
  @tailwindcss/language-server \
  bash-language-server \
  prettier \
  sql-formatter
