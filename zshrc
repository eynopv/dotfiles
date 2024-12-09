# Main .zshrc file

# Define variables for my zsh configurations
export ZSHRC_DIR="$(dirname "$(readlink -f "${(%):-%N}")")"
export ZSHRC_MAIN="$ZSHRC_DIR/zshrc"
export ZSHRC_GLOBAL="$ZSHRC_DIR/zshrc.global"
export ZSHRC_LOCAL="$ZSHRC_DIR/zshrc.local"

# Only run if in an interactive shell and only once
if [[ $- == *i* ]]; then
  if [[ -z "$ZSHRC_UPDATES_PULLED" ]]; then
    if git -C $ZSHRC_DIR diff-index --quiet HEAD --; then
      git -C $ZSHRC_DIR pull || echo "dotfiles: Unable to pull updates..."
    else
      echo "dotfiles: Please commit local changes..."
      sleep 1
    fi
    export ZSHRC_UPDATES_PULLED=1
  fi
fi

if [ -f "$ZSHRC_GLOBAL" ]; then
  source "$ZSHRC_GLOBAL"
fi

if [ -f "$ZSHRC_LOCAL" ]; then
  source "$ZSHRC_LOCAL"
fi
