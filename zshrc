# Main .zshrc file

# Define variables for my zsh configurations
export ZSHRC_DIR="$(dirname "$(readlink -f "${(%):-%N}")")"
export ZSHRC_LOCAL="$ZSHRC_DIR/zshrc.local"
export ZSHRC_GLOBAL="$ZSHRC_DIR/zshrc"

# Setup oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="simple"
plugins=(z fzf zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# Local binaries
export PATH=$PATH:$HOME/.local/bin

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  if command -v neovim > /dev/null 2>&1; then
    export EDITOR="neovim"
  elif command -v vim > /dev/null 2>&1; then
    export EDITOR="vim"
  else
    export EDITOR="vi"
  fi
fi

if [ -f "$ZSHRC_LOCAL" ]; then
  source "$ZSHRC_LOCAL"
fi
