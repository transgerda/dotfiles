function scrn -a 1 --description "Change the brightness of the screen"
  brightnessctl -q -s set $1
end
