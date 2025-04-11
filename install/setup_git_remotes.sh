#!/bin/bash

cd "$(dirname "$0")/../"
ls -l

# set remote for fetch
git remote set-url origin https://github.com/eynopv/dotfiles.git

# set remote for push
git remote set-url --push origin git@github.com:eynopv/dotfiles.git
