#!/usr/bin/env bash

filename="$1"

create_file() {
  echo "#!/usr/bin/env bash" > "$filename"
  echo "" >> "$filename"
  echo "set -eo pipefail" >> "$filename"

  chmod +x "$filename"
  "${VISUAL:-${EDITOR:-vim}}" "$filename"
}

if [ -z "$filename" ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

if [ -f "$filename" ]; then
  read -p "File $filename exists. Would you like to overwrite it? [y/N] " -r
  echo
  if [[ $REPLY == "y" || $REPLY == "y" ]]; then
    create_file
  else
    echo "Aborted"
    exit 0
  fi
else
  dir="$(dirname -- "$filename")"
  [ "$dir" = "." ] || mkdir -p -- "$dir"
  create_file
fi
