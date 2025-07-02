#!/bin/bash

set -eo pipefail

# TODO: PNPM installation script makes changes to zshrc which needs to avoided as our
# zshrc is shared with other machines

curl -fsSL https://get.pnpm.io/install.sh | sh -
~/.local/share/pnpm/pnpm env use --global 22.17

# pnpm
#export PNPM_HOME="/home/eynopv/.local/share/pnpm"
#case ":$PATH:" in
#  *":$PNPM_HOME:"*) ;;
#  *) export PATH="$PNPM_HOME:$PATH" ;;
#esac
# pnpm end
