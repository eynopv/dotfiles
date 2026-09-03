CUSTOM_XDG_DIRS="/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share"

if [[ -z "$XDG_DATA_DIRS" ]]; then
  export XDG_DATA_DIRS="${CUSTOM_XDG_DIRS}:${HOME}/.local/share:/usr/local/share:/usr/share"
else
  export XDG_DATA_DIRS="${CUSTOM_XDG_DIRS}:${XDG_DATA_DIRS}"
fi

if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
  exec sway
fi
