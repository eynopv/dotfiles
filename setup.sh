#!/usr/bin/env bash

set -eo pipefail

# set remote for fetch
git remote set-url origin https://github.com/eynopv/dotfiles.git

# set remote for push
git remote set-url --push origin git@github.com:eynopv/dotfiles.git
