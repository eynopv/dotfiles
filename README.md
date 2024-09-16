# dotfiles

This repository contains my `.zshrc` file and scripts to setup tools.

## Gettings Started

1. Clone the repo
2. Run `scripts/setup.sh` script
3. Run `scripts/create_links.sh` script
3. Start `zsh`
4. Install tools you need by running corresponding scripts

## zshrc

`zshrc` is responsible for auto-update and import of other files.

`zshrc.main` includes everything what should be shared between all devices.

`zshrc.local` includes only local stuff and should not be tracked in version control. All
installation scripts use this file.

## Font

ZSH themes require extra fonts to display correctly.

Current font I use is
[MesloLGS](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Meslo.zip)
