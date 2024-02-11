#!/bin/bash

a=$(cat e.in | wc -l)

if [[ -e e.in ]] && [[ $a -ge 2 ]]
then 
	exit
else
	exit 1
fi
