#!/usr/bin/env bash

MODE_FILE="$HOME/.cache/hypr-global-ws"

# workspace mapping
case "$1" in
  j) WS=1 ;;
  k) WS=2 ;;
  l) WS=3 ;;
  ";") WS=4 ;;
  *) exit 0 ;;
esac

MONITORS=$(hyprctl monitors -j | jq -r '.[].name')

# if GNOME mode OFF → normal behavior
if [[ ! -f "$MODE_FILE" ]]; then
  hyprctl dispatch workspace "$WS"
  exit 0
fi

# GNOME mode ON → sync all monitors
FOCUS=$(hyprctl monitors -j | jq -r '.[] | select(.focused).name')

while read -r MON; do
  hyprctl dispatch focusmonitor "$MON"
  hyprctl dispatch workspace "$WS"
done <<< "$MONITORS"

hyprctl dispatch focusmonitor "$FOCUS"
