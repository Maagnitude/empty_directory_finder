#!/bin/bash

# Welcome to Exercise 2

# Print active TCP connections along with date/time
# and write them in file ~/.tcp_connections

# Checking that there are no arguments given
if [ $# -ne 0 ]
then
	echo "You shall not give any arguments."
	exit 1
fi

# Formatting date and time as 'DD-MM-YYYY, HH:MM'

datetime=$(date +%d-%m-%Y,%H:%M)

# First we use 'netstat -at' to get all the active TCP connections
# and with "grep 'tcp'" we take the lines with tcp in them.
# Next we count those lines with 'wc -l' and 
# finally we print date/time, and number of TCP connections on screen
# as well as write them to the file.

tcpCon=$(netstat -at | grep 'tcp' | wc -l)

echo $datetime $tcpCon | tee -a ~/.tcp_connections

# I tested it without using "grep 'tcp'" and it returns 2 more lines
# Those are the 'title' and the 'column names'
# so we have to use grep to get the correct number of TCP connections.
