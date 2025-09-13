#!/usr/bin/env bash

# Ensure correct environment for pactl
export PATH=$HOME/.nix-profile/bin:/run/current-system/sw/bin:$PATH
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

# Get current volume
VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | head -n1)
MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

ICON="🔊"
if [ "$MUTE" = "yes" ]; then
    ICON="🔇"
elif [ "${VOL%?}" -le 30 ]; then
    ICON="🔈"
elif [ "${VOL%?}" -le 70 ]; then
    ICON="🔉"
fi

# Options for wofi popup
CHOICES=" Increase\n Decrease\n Toggle Mute"

ACTION=$(echo -e "$CHOICES" | wofi --show dmenu --prompt "$ICON $VOL")

case "$ACTION" in
    " Increase")
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        ;;
    " Decrease")
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        ;;
    " Toggle Mute")
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        ;;
esac

