#!/usr/bin/env bash

script_dir() {
  echo "$(realpath -- "${1:-${BASH_SOURCE[1]}}")"
}

module_name() {
  echo "$(basename -- "$(dirname -- "$(script_dir "${BASH_SOURCE[1]}")")")"
}

remove_block_from_local_zshrc() {
  local block_name=$1

  echo "Removing lines from local zshrc"

  if is_macos; then
    sed -i '' "/# @$block_name start/,/# @$block_name end/d" "$ZSHRC_LOCAL"
  else
    sed -i "/# @$block_name start/,/# @$block_name end/d" "$ZSHRC_LOCAL"
  fi
}

add_block_to_local_zshrc() {
  local block_name=$1

  echo "Adding lines to local zshrc"

  shift 1

  {
    echo "# @$block_name start"
    for line in "$@"; do
      echo -e "$line"
    done
    echo "# @$block_name end"
  } >> $ZSHRC_LOCAL
}

has_block_in_zshrc() {
  local block_name=$1

  if grep -Fq "# @$block_name start" "$ZSHRC_LOCAL"; then
    return 0
  fi

  return 1
}

upsert_block_to_zshrc() {
  local block_name=$1
  
  if has_block_in_zshrc "$block_name"; then
    remove_block_from_local_zshrc "$block_name"
  fi

  add_block_to_local_zshrc "$@"
}

create_symlink() {
  local source="$1"
  local destination="$2"

  # Remove already existing symlink
  if [ -L "$destination" ]; then
    rm -rf "$destination"
  fi

  echo "Creating symlink: $1 -> $2"

  ln -s "$source" "$destination"
}

remove_symlink() {
  local $symlink="$1"

  if [ -L "$symlink" ]; then
    echo "Removing symlink: $1"
    rm "$symlink"
  fi
}

sudo_validate() {
  sudo --validate || die "Sudo authentication failed"
}

die() {
  local message="$1"

  echo $message;
  exit 1;
}

ubuntu_codename() {
  grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs
}

readonly OS_LINUX="linux"
readonly OS_MACOS="macos"
readonly ARCH_X86_64="x86_64"
readonly ARCH_ARM64="arm64"
readonly UNKNOWN="unknown"

get_os() {
  local os=$(uname -s)
  case "$os" in
    Linux*) echo "$OS_LINUX" ;;
    Darwin*) echo "$OS_MACOS" ;;
    *) die "Unknown OS: $os"
  esac
}

get_arch() {
  local arch=$(uname -m)
  case "$arch" in
    x86_64) echo "$ARCH_X86_64" ;;
    arm64|aarch64) echo "$ARCH_ARM64" ;;
    *) die "Unknown architecture: $arch"
  esac
}

is_macos() {
  [ "$(get_os)" = "$OS_MACOS" ]
}

is_linux() {
  [ "$(get_os)" = "$OS_LINUX" ]
}

pkg_install() {
  local package
  for package in "$@"; do
    if is_macos; then
      brew install "$package"
    elif is_linux; then
      sudo apt install -y "$package"
    fi
  done
}

pkg_update() {
  if is_macos; then
    brew update
  elif is_linux; then
    sudo apt update
  fi
}
