#!/usr/bin/env bash

FILENAME="$1"

create_file() {
  echo "#!/usr/bin/env bash" > "$FILENAME"
  chmod +x "$FILENAME"
  "${VISUAL:-${EDITOR:-vim}}" "$FILENAME"
}

if [ -z "$FILENAME" ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

if [ -f "$FILENAME" ]; then
  read -p "File $FILENAME exists. Would you like to overwrite it? [y/N] " -r
  echo
  if [[ $REPLY == "y" || $REPLY == "y" ]]; then
    create_file
  else
    echo "Aborted"
    exit 0
  fi
else
  dir="$(dirname -- "$FILENAME")"
  [ "$dir" = "." ] || mkdir -p -- "$dir"
  create_file
fi
