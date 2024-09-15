#!/bin/bash

# TODO: PNPM installation script makes changes to zshrc which needs to avoided as our
# zshrc is shared with other machines

curl -fsSL https://get.pnpm.io/install.sh | sh -
pnpm env --global lts
