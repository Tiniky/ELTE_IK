#!/bin/bash

if [[ $# -eq 0 ]]
then
	echo 0
else
	ossz=$#
	for i in $(seq 1 $ossz)
	do
		[[ "$(expr $i)" -eq "$(expr $i)" ]] 2> /dev/null
		if [[ $? = "0" ]]
		then
			echo $((RANDOM % $ossz))
		fi
	done
fi


