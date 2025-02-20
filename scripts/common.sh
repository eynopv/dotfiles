#!/bin/bash

remove_block_from_local_zshrc() {
  local block_name=$1

  echo "Removing lines from local zshrc"

  sed -i "/# @$block_name start/,/# @$block_name end/d" $ZSHRC_LOCAL
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

create_symlink() {
  local source="$1"
  local destination="$2"

  # Remove already existing symlink
  if [ -L "$destination" ]; then
    rm -rf "$destination"
  fi

  ln -s "$source" "$destination"
}

remove_symlink() {
  local $symlink="$1"

  if [ -L "$symlink" ]; then
    rm "$symlink"
  fi
}
