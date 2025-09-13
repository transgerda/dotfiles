pkill tofi
pkill rofi

if [[ $? -eq 1 ]]; then
	rofi -show drun | sh
fi

