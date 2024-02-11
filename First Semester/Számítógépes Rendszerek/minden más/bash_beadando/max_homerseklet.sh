#!/bin/bash

max=0
maxX=0
maxY=0
maxdat=0
maxora=0
index=0
i=0

while read sor || [[ -n $sor ]]
do
	(( i++ ))
	a=0
	IFS=";"; for adat in $sor
	do
		(( a++ ))
		if [[ $a -eq 5 ]]
		then
			if [[ $adat -gt $max ]]
			then
				max=$adat
				index=$i
			fi
		fi
	done
done < meresek.txt

i2=0
while read sor2 || [[ -n $sor2 ]]
do
	(( i2++ ))
	b=0
	IFS=";"; for adat2 in $sor2
        do
		(( b++ ))
		if [[ $i2 -eq $index ]]
		then
			if [[ $b -eq 1 ]]
			then
				maxX=$adat2
			elif [[ $b -eq 2 ]]
			then
				maxY=$adat2
			elif [[ $b -eq 3 ]]
                        then
                                maxdat=$adat2
			elif [[ $b -eq 4 ]]
                        then
                                maxora=$adat2
			fi
		fi
	done
done < meresek.txt

echo " A(z) $maxX,$maxY koordinátákon volt, $maxdat $maxora -kor a legmelegebb ($max fok)"
