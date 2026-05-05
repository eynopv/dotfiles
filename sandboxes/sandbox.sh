#!/usr/bin/env bash

set -eo pipefail

show_help() {
    cat << EOF
Usage: $(basename "$0") [IMAGE]

IMAGE:
    pi      Use pi image
    gemini  Use gemini image
EOF
}

image=""

if [[ -n "$1" ]]; then
  case "$1" in
    pi|gemini)
      image="$1"
      ;;
    -h|--help)
      show_help
      exit 0
      ;;
    *)
      echo "Error: Unknown image '$1'"
      echo ""
      show_help
      exit 1
      ;;
  esac
fi

workspace_dir=$(pwd)

if [[ -n "$2" && -d "$2" ]]; then
  workspace_dir="$(realpath $2)"
fi

echo "$workspace_dir"

docker run --rm -it \
  -e TERM=$TERM \
  -v "$HOME/.pi:/home/coder/.pi" \
  -v "$workspace_dir:/home/coder/workspace" \
  "$image"
