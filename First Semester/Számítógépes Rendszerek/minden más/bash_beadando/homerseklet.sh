#!/bin/bash

x=$1
x=${x//./}
y=$2
y=${y//./}

meres=0
meresdat=0

while read sor || [[ -n $sor ]]
do
	a=0
	X=FALSE
	egyezik=FALSE
	IFS=";"; for adat in $sor
	do
		(( a++ ))
		if [[ $a -eq 1 ]]	#az első adat az x koordináta
		then
			koord=${adat//./}
			if [[ $x -eq $koord ]]
			then
				X=TRUE
			fi
		elif [[ $a -eq 2 ]]	#a második meg az y
		then
			koord=${adat//./}	
			if [[ y -eq koord ]] && [[ $X == "TRUE" ]] 	#ha mindkettő igaz akkor ott 
			then
				egyezik=TRUE
			fi
		elif [[ $a -eq 3 ]] && [[ $egyezik == "TRUE" ]]		#a harmadik adat a dátum ÉS ha a koordináták stimmelnek
		then
			if [[ $meresdat != $adat ]]			#ha a dátum nem egyezik meg az előző mért dátummal akkor kicseréli
			then
				meresdat=$adat
				(( meres ++ ))
			fi

		fi
	done
done < meresek.txt

echo $meres
