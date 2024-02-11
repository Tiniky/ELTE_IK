#!/bin/bash

n=$1

for i in $(seq 1 $n)
do
	for j in $(seq 1 $n)
	do
		if [[ i%2 -eq 0 ]]
		then
			if [[ j%2 -eq 0 ]]
			then
				echo -n $n
			else
				echo -n " "
			fi
		elif [[ j%2 -eq 0 ]]
		then
			echo -n " "
		else
			echo -n $n
		fi
	done
	echo -e "\n"
done
