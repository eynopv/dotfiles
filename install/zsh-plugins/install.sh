#!/usr/bin/env bash

set -eo pipefail

SCRIPT_PATH="$(realpath -- "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname -- "$SCRIPT_PATH")"
MODULE_NAME="$(basename -- "$SCRIPT_DIR")"

source "$SCRIPT_DIR/../common.sh"

mkdir -p ~/.zsh

if [[ ! -d "$HOME/.zsh/zsh-autosuggestions" ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
fi

if [[ ! -d "$HOME/.zsh/zsh-syntax-highlighting" ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting
fi

if [[ ! -d "$HOME/.zsh/zsh-z" ]]; then
  git clone https://github.com/agkozak/zsh-z $HOME/.zsh/zsh-z
fi

upsert_block_to_zshrc $MODULE_NAME \
  "source $SCRIPT_DIR/zshrc"
