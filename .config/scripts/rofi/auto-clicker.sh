#!/usr/bin/env bash

PROC_NAME="autoclicker-loop"

# If running → kill all and exit
if pgrep -f "$PROC_NAME" > /dev/null; then
    pkill -f "$PROC_NAME"
    exit 0
fi

choice=$(printf "10 CPS Left\n100 CPS Left\n1 CPS Left\n0.1 CPS Left\n10 CPS Right\n1 CPS Right\n0.1 CPS Right" \
  | rofi -dmenu -p "Auto Clicker" -theme ~/.config/rofi/global.rasi)

get_delay() {
    awk "BEGIN { print 1/$1 }"
}

start_clicking() {
    button="$1"
    cps="$2"
    delay=$(get_delay "$cps")

    # Rename this process so we can target it
    exec -a "$PROC_NAME" bash -c '
        button="$1"
        delay="$2"

        while true; do
            if [[ "$button" == "left" ]]; then
                ydotool click 0xC0
            else
                ydotool click 0xC1
            fi
            sleep "$delay"
        done
    ' _ "$button" "$delay"
}

case "$choice" in
  "10 CPS Left") start_clicking left 10 & ;;
  "100 CPS Left") start_clicking left 40 & ;;
  "1 CPS Left") start_clicking left 1 & ;;
  "0.1 CPS Left") start_clicking left 0.1 & ;;
  "10 CPS Right") start_clicking right 10 & ;;
  "1 CPS Right") start_clicking right 1 & ;;
  "0.1 CPS Right") start_clicking right 0.1 & ;;
esac
