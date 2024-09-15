#!/bin/bash

sudo apt-get install -y zlib1g zlib1g-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y libbz2-dev
sudo apt-get install -y libncurses-dev
sudo apt-get install -y libreadline-dev
sudo apt-get install -y libffi-dev
sudo apt-get install -y libsqlite3-dev
sudo apt-get install -y liblzma-dev
sudo apt-get install -y tk-dev

rm -rf $HOME/.pyenv

curl https://pyenv.run | bash

if ! grep -Fq "# pyenv" "$ZSHRC_LOCAL"; then
  echo "Adding things to zshrc"
  echo "" >> $ZSHRC_LOCAL
  echo "# pyenv start" >> $ZSHRC_LOCAL
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $ZSHRC_LOCAL
  echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> $ZSHRC_LOCAL
  echo 'eval "$(pyenv init -)"' >> $ZSHRC_LOCAL
  echo "# pyenv end" >> $ZSHRC_LOCAL
else
  echo "Skipping addition to zshrc"
fi

PYTHON_VERSION=3.12

echo "Installing python $PYTHON_VERSION"
INSTALL_PYTHON="$HOME/.pyenv/bin/pyenv install $PYTHON_VERSION"
echo "$INSTALL_PYTHON"
eval "$INSTALL_PYTHON"

echo "Setting global python $PYTHON_VERSION"
SET_GLOBAL="$HOME/.pyenv/bin/pyenv global $PYTHON_VERSION"
echo "$SET_GLOBAL"
eval "$SET_GLOBAL"
