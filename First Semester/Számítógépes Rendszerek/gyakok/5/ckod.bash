#!/bin/bash

#$1 mit
#$2 mire
#$3 mintabemenet

g++ -o $2 $1 && ./$2 < $3
