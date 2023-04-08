#!/bin/bash

# Welcome to Exercise 5_1

# First, we find the logfile and store its path to variable 'path'
# This way, the program will run, wherever the file will be.

path=$(find /home/ -iname apache.log.txt -type f)

# We take the logfile content, split every line, then split every part 
# that has a space, and take the first string in each line. Finally we 
# store it in  'logfile' variable.

logfile=$(cat $path | awk -F '\n' '{print}' | awk -F ' ' '{print $1}')

# For every substring we stored in the logfile variable (the IPs we want)
# we sort them, count every unique combination (uniq -c), sort them again
# numerically and in descending order (sort -rn) and finally take the first
# five of them and print them on screen (head -5).

for record in $logfile
do
	echo $record
done | sort | uniq -c | sort -rn | head -5 
