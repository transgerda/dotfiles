#!/usr/bin/env bash

# Get volume and mute status
VOL=$(pamixer --get-volume)
MUTE=$(pamixer --get-mute)

if [ "$MUTE" = "true" ]; then
    ICON=""  # muted icon
else
    ICON=""  # volume icon
fi

# Create a slider of 10 blocks


# Output JSON for Waybar
echo "$ICON $VOL%"
