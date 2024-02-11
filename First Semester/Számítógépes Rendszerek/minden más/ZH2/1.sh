#!/bin/bash
#
# 1. Feladat

file=$1

if ! [[ -f $file ]]
then
    touch $file
elif [[ -s $file ]]
then
    	cat $file
fi
