#!/bin/bash

exit=0

while [[ "$exit" -eq 0 ]]; do
	read -p "Would you like to start X? (y/n) " answer
	if [[ ${answer} = "y" || ${answer} = "Y" ]]; then
		startx;
		exit=1;
	elif [[ ${answer} = "n" || ${answer} = "N" ]]; then
		exit=1;
	fi
done
