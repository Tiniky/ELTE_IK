#!/bin/bash

max=0

while read sor
do
	[[ -z "$sor" ]] && break

	aktualis=$(expr "$sor" | wc -c)
	
	if [[ aktualis -gt max ]]
	then		
		max=$aktualis
		echo $sor
	fi
done
