# unipicker --command "rofi -dmenu -p 'Emoji' -theme ~/.config/rofi/config.rasi" --copy-command wl-copy
unipicker --command "rofi -dmenu -p 'Emoji' -theme ~/.config/rofi/config.rasi -format i -lines 10 -display-icons | while read emoji; do echo -n \"$emoji\" | wl-copy; done"
