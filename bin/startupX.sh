#!/bin/bash

menu() {
	read -p "Would you like to start X? (y/n) " answer
	case "$answer" in
		y|Y ) startx;;
		n|N ) exit 0;;
		* )echo "invalid option"; menu;;
	esac
}

menu
