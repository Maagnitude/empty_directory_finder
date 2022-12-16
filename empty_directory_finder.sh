#!/bin/bash

# Welcome to Exercise 1

# If the user gives more than 1 argument or no arguments the program exits
if [ $# -ne 1 ]
then
	echo -e "You must give an argument.\nUsage: $0 directory-name"
	exit 1
fi	

# If the user gives a filename, or a random arg the program exits with a message
if [ -d "$1"  ]
then
	find "$1" -type d -iname "[^.]*" -empty -not -path '*/.*'
elif [ -f "$1" ]
then	
	echo "$1 is a file. Please give a folder"
	exit 1
else
	echo -e "$1 is neither a file, nor a directory.\nPlease give a directory name\nUsage: $0 directory-name"
	exit 1
fi

# The program searches for directories (-type d)  under the directory given
# with their name not beginning with '.' (-name "[^.]", and only empty ones
# Finally with the '-not -path '*/.*'', we exclude hidden directory exploration.
