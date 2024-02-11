#!/bin/bash

read dmg
a=0

while read sor || [[ -n $sor ]]
do
	IFS=";"; for szo in $sor
	do
		(( a++ ))
		if [[ a%2 -eq 1 ]]
		then
			nev=$szo
		elif [[ a%2 -eq 0 ]]
        then
            if [[ szo -gt dmg ]]
            then
                (( szo -= dmg ))
                echo "The dragon that survived is $nev with $szo hp"
				exit
			else
			(( dmg -= szo ))
			fi
		fi
				
	done
done < e.in

if [[ dmg -gt 0 ]]
then
	echo "No dragons left :c"
fi
