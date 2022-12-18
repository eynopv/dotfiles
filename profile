
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# NodeJS
VERSION="v14.15.1"
DISTRO="linux-x64"
export PATH="/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
. "$HOME/.cargo/env"
