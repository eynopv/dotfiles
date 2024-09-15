# dotfiles

This repository contains my `.zshrc` file and scripts to setup tools.

## Gettings Started

1. Clone the repo
2. Run `scripts/setup.sh` script
3. Run `scripts/create_links.sh` script
3. Start `zsh`
4. Install tools you need by running corresponding scripts

## zshrc

Main `.zshrc` file is `zhrc`, this file imports `zhrc.local` which is responsible for local
dependencies and is not tracked in version control.

Any local changes should be stored in `zhrc.local` and any global in `zhrc` to share them between
devices.
