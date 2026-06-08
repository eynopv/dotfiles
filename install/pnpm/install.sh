#!/bin/bash

set -eo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../common.sh"

MODULE_NAME=$(module_name)
VERSION=22.22.3
pnpm_home="${PNPM_HOME}"

if [[ -d "$pnpm_home" ]]; then
  echo "Updating pnpm"
  "$pnpm_home/bin/pnpm" self-update
else
  echo "Installing pnpm"

  if [[ -z $pnpm_home ]]; then
    case "$(get_os)" in
      "$OS_MACOS") pnpm_home="$HOME/Library/pnpm" ;;
      "$OS_LINUX") pnpm_home="$HOME/.local/share/pnpm" ;;
      *) die "Unsupported OS: $(get_os)" ;;
    esac
  fi

  curl -fsSL https://get.pnpm.io/install.sh | sh -
  # Remove installer’s rc edits (between # pnpm and # pnpm end)
  if [ -f "$ZSHRC_MAIN" ]; then
    # TODO: this still keeps single line
    sed -i.bak -e '/^# pnpm$/,/^# pnpm end$/d' "$ZSHRC_MAIN"
  fi
fi

upsert_block_to_zshrc "$MODULE_NAME" \
  "export PNPM_HOME=\"$PNPM_HOME\"" \
  'export PATH="$PNPM_HOME/bin:$PATH"' \
  'alias pn=pnpm'
export PNPM_HOME="$pnpm_home"
export PATH="$pnpm_home/bin:$PATH"

# Install/select Node.js version
"$PNPM_HOME/bin/pnpm" runtime set node "$VERSION" -g
