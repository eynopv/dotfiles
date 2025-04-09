#!/bin/bash

set -eo pipefail

OPERATION=$1
if [ -z "$2" ]; then
  SCALE=0.5
else
  SCALE=$2
fi

FOCUSED_OUTPUT=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused == true) | .name')

if [ -z "$FOCUSED_OUTPUT" ]; then
  echo "No focused output"
  exit 1
fi

CURRENT_SCALE=$(swaymsg -t get_outputs | jq -r --arg name "$FOCUSED_OUTPUT" '.[] | select(.name == $name) | .scale')
NEW_SCALE=1
case "$OPERATION" in
  "in")
    NEW_SCALE=$(echo "$CURRENT_SCALE + $SCALE" | bc)
    ;;
  "out")
    NEW_SCALE=$(echo "$CURRENT_SCALE - $SCALE" | bc)
    ;;
  *)
    echo 'Invalid command. Use "in" or "out" as first argument'
    exit 1
    ;;
esac

swaymsg output "$FOCUSED_OUTPUT" scale "$NEW_SCALE"

echo "Changed scale of $FOCUSED_OUTPUT from $CURRENT_SCALE to $NEW_SCALE"
