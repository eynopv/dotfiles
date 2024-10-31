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
