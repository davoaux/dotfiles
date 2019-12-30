#!/bin/bash

read -p "Would you like to start X? (y/n) " answer

if [[ ${answer} == "y" || ${answer} == "Y" ]]; then
	startx	
fi

