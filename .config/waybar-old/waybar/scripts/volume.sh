#!/usr/bin/env bash

LOG=/tmp/volume-debug.log
echo "$(date) called with $1" >> $LOG

case "$1" in
    up)
        pactl set-sink-volume @DEFAULT_SINK@ +5% ;;
    down)
        pactl set-sink-volume @DEFAULT_SINK@ -5% ;;
    toggle)
        pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
    *)
        echo "Usage: $0 {up|down|toggle}" >&2
        exit 1 ;;
esac

