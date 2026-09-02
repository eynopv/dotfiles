#!/bin/bash

opt_logout="🔐 Logout"
opt_sleep="💤 Sleep"
opt_shutdown="🛑 Shutdown"
opt_reboot="🔁 Reboot"

choice=$(echo -e "$opt_logout\n$opt_sleep\n$opt_shutdown\n$opt_reboot" | fuzzel -d)

case "$choice" in
  "$opt_logout")
    swaymsg exit
    ;;
  "$opt_sleep")
    systemctl suspend
    ;;
  "$opt_shutdown")
    systemctl poweroff
    ;;
  "$opt_reboot")
    systemctl reboot
    ;;
esac
