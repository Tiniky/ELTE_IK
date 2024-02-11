#!/bin/bash

read S
read A
read D

while read sor || [[ -n $sor ]]
do
	a=0
	ready=FALSE
	IFS=";"; for szo in $sor
	do	
		(( a++ ))
		if [[ $a -eq 1 ]]
		then
			nev=$szo
		elif [[ $a -eq 2 ]]
		then 
			ar=$szo
		else
			db=$szo
		fi

		if [[ szo = A ]]
		then
			if [[ db -ge D ]]
			then
				ready=TRUE
			else
				echo "Csak $db db van a $nev termékből :c"
		fi

		if [[ $ready = "TRUE" ]]
		then
			(( ujS = S - D * ar ))
			(( ujdb = db - D ))
			echo "$nev $ar $ujdb"
		else
			echo "$nev $ar $db"
		fi
	done
done < e_items.csv

if [[ $S -gt 0 ]]
then
	echo "Sikeres vásárlás, maradt $S forintod :D"
fi

