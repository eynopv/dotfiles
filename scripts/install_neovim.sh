#!/bin/bash

mkdir -p ~/.local/share/nvim

curl -L https://github.com/neovim/neovim/releases/download/v0.10.3/nvim-linux64.tar.gz | tar -xz -C ~/.local/share/nvim

# plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if ! grep -Fq "# neovim start" "$ZSHRC_LOCAL"; then
  echo "Adding neovim to zshrc"
  echo "" >> $ZSHRC_LOCAL
  echo "# neovim start" >> $ZSHRC_LOCAL
  echo -e "export PATH=\$HOME/.local/share/nvim/nvim-linux64/bin:\$PATH" >> $ZSHRC_LOCAL
  echo -e "export PATH=\$HOME/.local/share/lua-ls/bin:\$PATH" >> $ZSHRC_LOCAL
  echo 'alias vim="nvim"' >> $ZSHRC_LOCAL
  echo 'alias vi="nvim"' >> $ZSHRC_LOCAL
  echo 'alias v="nvim"' >> $ZSHRC_LOCAL
  echo "# neovim end" >> $ZSHRC_LOCAL
else
  echo "Skipping addition to zshrc"
fi

# Language servers
mkdir -p ~/.local/share/lua-ls && curl -L https://github.com/LuaLS/lua-language-server/releases/download/3.10.6/lua-language-server-3.10.6-linux-x64.tar.gz | tar -xz -C ~/.local/share/lua-ls
# Requires PNPM preinstalled
pnpm install -g typescript typescript-language-server
pnpm install -g vscode-langservers-extracted
pnpm install -g @tailwindcss/language-server
