#!/bin/bash
szum=0
if [ $# -gt 0 ];
then
for i in $@
do
# echo $i
szum=`expr $szum + $i`
done
echo $szum
else
echo cat ps.txt
fi
