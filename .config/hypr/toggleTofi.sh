pkill tofi

if [[ $? -eq 1 ]]; then
	tofi-run --drun-launch=true | sh
fi

