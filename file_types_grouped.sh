#!/bin/bash

# Welcome to Exercise 3

# This script has to take a directory as argument and return its files
# grouped by their file type. They must be sorted and the format must be:
# "Total number of this file type"(sorted in descending order) / "file type"

# Setting the Internal Field Separator to '\n', so we can take each
# directory/filename without the 'problem of spaces'
IFS=$'\n'

# Checking for the correct number of args
if [ $# -ne 1 ] 
then
	echo "You must give one argument"
	exit 1
fi

# Checking if the arg is a file, so we'll end the program
if [ -f $1 ]
then
	echo "Please give a directory name, not a filename"
	exit 1
elif [ -d $1 ]
then
	# Changing to the correct dir, given by the arg
	cd $1

	# We take every file in the result of the following command
	# ls to list the directories/files. awk to filter those we want
	# -F to use '\n' as a field separator. So we take each line (directory/file)
	for file in $(ls | awk -F '\n' '{print}')
	do
		if [ -d $file ]     # if it's a directory we continue the iteration
		then
			continue    
		else           	    # if it's a file, we get its file type
	       			    # we separate the second part (after ':')	
			echo $(file $file | awk -F : '{print $2}')
		fi
	done | sort | uniq -c | sort -r
	# Finally we sort all the file, count the total of the unique ones
	# and sort them by their first columns, which is the total number
	# of each file type.
else
	echo "$1 is neither a file, nor a directory. Please give a directory."
	exit 1
fi
