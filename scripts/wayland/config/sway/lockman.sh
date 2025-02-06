#!/bin/bash

# Start swayidle in the background to turn off the screen after 10 seconds
swayidle -w \
  timeout 10 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' &

# Get the PID of the swayidle process
IDLE_PID=$!

# Lock the screen immediately
swaylock -c 550000

# After unlocking, kill swayidle to stop the timeout from running indefinitely
kill $IDLE_PID
