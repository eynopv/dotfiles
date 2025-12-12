#!/usr/bin/env bash

# pm - Package Manager

set -eo pipefail

source "$ZSHRC_DIR/install/common.sh"

OPERATION="$1"
PACKAGE="$2"
SCRIPT="$ZSHRC_DIR/install/$PACKAGE/${OPERATION}.sh"

show_help_and_exit() {
  echo "Usage: $0 <install|remove> <filename>"
  exit 1
}

install_package() {
  echo "Installing $PACKAGE"
  "$SCRIPT"
  echo "$PACKAGE is installed"
}

remove_package() {
  echo "Removing $PACKAGE"
  "$SCRIPT"
  echo "$PACKAGE is removed"
}

if [ -z "$OPERATION" ] || [ -z "$PACKAGE" ]; then
  show_help_and_exit
fi

if [ ! -e "$SCRIPT" ]; then
  echo "\"$PACKAGE\" $OPERATION script not found: $SCRIPT"
  exit 1
fi

case "$OPERATION" in
  "install")
    install_package
    ;;
  "remove")
    remove_package
    ;;
  *)
    show_help_and_exit
    ;;
esac
