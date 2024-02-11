#!/bin/bash

read N

if [[ $N -gt 0 ]]
then
	for i in $(seq 1 $N)
	do
		echo $i > $i.file
	done
else
	exit 2
	echo HIBA
fi
