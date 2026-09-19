#!/usr/bin/env bash

set -eo pipefail

brightnessctl set $1 && notify-send \
  -a "" \
  -t 1000 \
  -h string:x-canonical-private-synchronous:brightness \
  -h "int:value:$(brightnessctl -m | cut -d, -f4)" \
  "Brightness"
