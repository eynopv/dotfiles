#!/bin/bash

set -eo pipefail

SCRIPT_PATH="$(realpath -- "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname -- "$SCRIPT_PATH")"

source "$SCRIPT_DIR/../common.sh"

MODULE_NAME=python
PYTHON_VERSION=3.14

sudo apt update
sudo apt install -y \
  zlib1g \
  zlib1g-dev \
  libssl-dev \
  libbz2-dev \
  libncurses-dev \
  libreadline-dev \
  libffi-dev \
  libsqlite3-dev \
  liblzma-dev \
  tk-dev 

rm -rf $HOME/.pyenv

curl https://pyenv.run | bash

if ! has_block_in_zshrc "$MODULE_NAME"; then
  add_block_to_local_zshrc "$MODULE_NAME" \
    'export PYENV_ROOT="$HOME/.pyenv"' \
    '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' \
    'eval "$(pyenv init -)"'
fi

echo "Installing python $PYTHON_VERSION"
INSTALL_PYTHON="$HOME/.pyenv/bin/pyenv install $PYTHON_VERSION"
echo "$INSTALL_PYTHON"
eval "$INSTALL_PYTHON"

echo "Setting global python $PYTHON_VERSION"
SET_GLOBAL="$HOME/.pyenv/bin/pyenv global $PYTHON_VERSION"
echo "$SET_GLOBAL"
eval "$SET_GLOBAL"

echo "Installing pyright"
pnpm add -g pyright

echo "Installing pipx"
sudo apt install pipx
