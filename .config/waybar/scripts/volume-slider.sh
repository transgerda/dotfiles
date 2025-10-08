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

if [ "$VOL" -eq 0 ]; then
    FILLED=0
else
    FILLED=$((VOL / 10))
fi

EMPTY=$((10 - FILLED))
BAR=$(printf '█%.0s' $(seq 1 $FILLED))
BAR+=$(printf '░%.0s' $(seq 1 $EMPTY))

# Output JSON for Waybar
echo "$ICON $VOL%"

