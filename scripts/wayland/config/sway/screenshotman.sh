#!/bin/bash

# Define the screenshot directory
SCREENSHOT_DIR="$HOME/Pictures/screenshots"
mkdir -p "$SCREENSHOT_DIR"

# Generate a timestamped filename
FILENAME="$SCREENSHOT_DIR/screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"

# Take a screenshot and save to file
grim -g "$(slurp)" "$FILENAME"

# Copy the screenshot to clipboard
wl-copy < "$FILENAME"

#notify-send "Screenshot saved" "File: $FILENAME"
