#!/bin/bash

max=sort | awk -F ';' '{print $1, $2}' meresek.txt | uniq -c | sort -nr | head -1
