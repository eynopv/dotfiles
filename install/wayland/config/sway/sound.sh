#!/usr/bin/env bash

set -eo pipefail

if [[ $# -ne 2 ]]; then
  printf 'Usage: %s {sink|source} {toggle|5%+|5%-}\n' "$0" >&2
  exit 2
fi

device=$1
change=$2

notify() {
  local title=$1
  local message=$2
  local tag=$3
  local level=${4:-}

  local -a args=(
    -a ''
    -t 1000
    -h "string:x-canonical-private-synchronous:$tag"
  )

  if [[ -n "$level" ]]; then
    args+=(-h "int:value:$level")
  fi

  notify-send "${args[@]}" "$title" "$message"
}

case "$device" in
  sink)
    if [[ "$change" == "toggle" ]]; then
      pactl set-sink-mute @DEFAULT_SINK@ toggle

      mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

      if [[ "$mute" == "yes" ]]; then
        notify "Volume" "Muted" volume
      else
        notify "Volume" "Unmuted" volume
      fi
    else
      pactl set-sink-volume @DEFAULT_SINK@ "$change"

      level=$(pactl get-sink-volume @DEFAULT_SINK@ |
        awk -F/ 'NR == 1 {
          gsub(/[ %]/, "", $2)
          print $2
          exit
        }'
      )

      notify "Volume" "" volume "$level"
    fi
    ;;
  source)
      if [[ "$change" != "toggle" ]]; then
        printf 'The source only supports toggle\n' >&2
        exit 2
      fi

      pactl set-source-mute @DEFAULT_SOURCE@ toggle

      mute=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')

      if [[ "$mute" == "yes" ]]; then
        notify "Microphone" "Muted" microphone
      else
        notify "Microphone" "Unmuted" microphone
      fi
      ;;

    *)
      printf 'Unknown audio type: %s\n' "$audio_type" >&2
      exit 2
      ;;
esac
