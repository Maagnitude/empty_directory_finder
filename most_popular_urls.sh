#!/bin/bash

# Welcome to Exercise 5_2

IFS=$'\n'

# First, we find the logfile and store its path to variable 'path'
# This wat, the program will run, wherever the file will be.
path=$(find /home/ -iname apache.log.txt -type f)

# We take the logfile content, split every line, then split every part
# that has a space, and take the 

logfile=$(cat $path | awk -F '\n' '{print}' | awk -F '"' '{print $2}' | awk -F ' ' '{print $1 " " $2}' | grep -v '\.' | grep -v '~' | grep -v '-' | grep -v '*' | grep -v '=') 

# Now, we sort all the lines, group the unique ones, and sort them again in descending order.

for record in $logfile
do
	echo $record
done | sort | uniq -c | sort -rn | head -20
