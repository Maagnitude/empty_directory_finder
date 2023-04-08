#!/bin/bash

# Welcome to Exercise 4

# Checking if there are >2 arguments, or else the script will have no use
# because if the user gives 2 arguments (ex. incr 4), we can't sort one number.
if [[ $# < 3 ]] 
then
	echo 'Please give more than 3 and less than 10 arguments'
	exit 1
fi

# Here we set a counter to check the first argument. The moment it is checked
# as not a number, it is set equal to 2, so the next argument won't be checked
counter=1

# Checking the first argument
if [[ "$1" =~ ^[0-9]{1,}$ ]]
then
	echo "First argument must be 'incr' or decr'"
	exit 1
fi

# Checking each argument, if it's a number (except the first one, which
# we will approve, with the help of the counter).
for i in $*
do
	if [[ "$i" =~ ^[0-9]{1,}$ ]]
	then
		continue
	else
		if [ $counter -eq 1 ]
		then
			counter=2
			continue
		fi
		echo "$i is not a number. Please give a number."
		exit 1
	fi
done

# FIRST TRY - doing it with 'case' and checking possible combinations
# Checking if the first argument is 'Inc'-like or 'Dec'-like
# and setting the order variable to 1 or 2, respectively

#CODE:
#case $1 in
#	"incr"|"Incr"|"INCR"|"Increment"|"increment"|"Increase"|"increase")
#		order=1
#		;;
#	"decr"|"Decr"|"DECR"|"Decrement"|"decrement"|"Decrease"|"decrease")
#		order=2
#		;;
#	*)
#		echo "Please choose an order to sort the numbers"
#		;;
#esac

# SECOND (more correct) TRY - using something like 'contains()'
# with which we check if the first argument has the substring "inc" in it.
# or else it must have "dec".
if [[ $1 == *"inc"* ]]
then
	order=1
elif [[ $1 == *"dec"* ]]
then
	order=2
else 
	echo "There must be a typo in the first argument. Please try again!"
	echo "First argument should be something like 'inc' or 'dec'."
	exit 1
fi

# shifting our args, one spot to the left, in order to 'delete' the 
# first argument, which we will not need. So we are left with numbers.
shift

# Checking if the order variable is equal to 1 --> increment
# 				          or 2 --> decrement
if [ $order -eq 1 ]
then
	for num in $*
	do
		echo $num
	done | sort -n		# -n to sort the numerical values
else
	for num in $*
	do
		echo $num
	done | sort -rn         # -r to reverse sort --> decrement
fi
