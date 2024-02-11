#!/bin/bash

i=0

while read a
do
	if [[ $a%3 -eq 0 ]]
	then
		((i++))
	fi
done < b.ki

echo $i
