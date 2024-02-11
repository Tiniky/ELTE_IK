#!/bin/bash

if [[ $# -eq 2 ]]
then
	if [[ ${#1} -gt ${#2} ]]
	then
		echo $1 | rev
	else
		echo $2 | rev
	fi
else
	echo "két paramétert adj meg next time"
fi
