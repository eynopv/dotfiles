#!/usr/bin/env bash

set -eo pipefail

SCRIPT_PATH="$(realpath -- "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname -- "$SCRIPT_PATH")"

source "$SCRIPT_DIR/../common.sh"

MODULE_NAME="vagrant"

install_hashicorp_keyring() {
  local keyring="/usr/share/keyrings/hashicorp-archive-keyring.gpg"
  local tmp; tmp="$(mktemp)"
  trap 'rm -f "$tmp"' RETURN

  wget -qO- https://apt.releases.hashicorp.com/gpg | gpg --dearmor >"$tmp"

  if ! sudo test -f "$keyring" || ! sudo cmp -s "$tmp" "$keyring"; then
    sudo install -m 0644 "$tmp" "$keyring"
  fi
}

install_hashicorp_repo() {
  local keyring="/usr/share/keyrings/hashicorp-archive-keyring.gpg"
  local list="/etc/apt/sources.list.d/hashicorp.list"
  local codename arch line

  codename="$(ubuntu_codename)"
  arch="$(dpkg --print-architecture)"
  line="deb [arch=$arch signed-by=$keyring] https://apt.releases.hashicorp.com $codename main"

  if ! sudo test -f "$list" || ! echo "$line" | sudo cmp -s - "$list"; then
    echo "$line" | sudo tee "$list" >/dev/null
  fi
}

main() {
  sudo_validate

  install_hashicorp_keyring
  install_hashicorp_repo

  sudo apt update
  sudo apt install -y vagrant
}

main
