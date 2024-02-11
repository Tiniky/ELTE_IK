#!/bin/bash

sumrand=0

if [[ -f nevek2.txt ]]
then
	rm nevek2.txt
fi

while read sor || [[ -n $sor ]]
do
	a=0
	for szo in $sor
	do
		(( a++ ))
		if [[ $a -eq 1 ]]
		then
			nev=$szo
		fi
	done

	if [[ $a -eq 2 ]]
	then
		szam=$szo
	else
		szam=$((RANDOM % 281 + 120))
		(( szumrand += szam ))
	fi

	echo "$nev $szam" >> nevek2.txt
done < nevek.txt

echo $szumrand
