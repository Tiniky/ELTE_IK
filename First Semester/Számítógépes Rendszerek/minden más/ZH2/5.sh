#!/bin/bash

read n
read m
(( m += 2 ))

for i in $(seq 1 $n)
do
	for j in $(seq 1 $m)
	do
		for a in $(seq 2 3 $m)
		do
			if [[ i -eq a ]]
			then
				if [[ $j -gt 0 ]]
				then
					echo -n "#"
				fi
			elif [[ $j -eq 1 ]] || [[ j -eq m ]]
			then
				echo -n "#"
			else
				echo -n " "
			fi
		done
	done
	echo -e "\n"
done

