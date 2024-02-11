#!/bin/bash

if [ "$1" -eq "$1" ] 2> /dev/null
then
	for i in $(seq 1 $1)
	do
		echo $(( RANDOM % 10 + 11 )) >> b.ki
	done
else
	echo "HIBA"
fi
