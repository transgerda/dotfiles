#!/usr/bin/env bash

ws="$1"

for mon in $(hyprctl monitors -j | jq -r '.[].name'); do
    hyprctl dispatch focusmonitor "$mon"
    hyprctl dispatch workspace "$ws"
done
