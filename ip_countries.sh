#!/bin/bash

# Welcome to Exercise 5_3

# First, we find the logfile and store its path to the variable 'path'

path=$(find /home/ -iname apache.log.txt -type f)

# We take the logfile content, split every line, then split every part
# that has a space, and take the first part which is the ip addresses.

logfile=$(cat $path | awk -F '\n' '{print}' | awk -F ' ' '{print $1}')

# We sort the ip addresses, count the total appearances of each one of them,
# sort them again in descending order, split them by the space, to take only
# the ips (without the total number), and store the first 10 of them in the 
# variable 'results'.

results=$(for record in $logfile
	  do
	          echo $record
	  done | sort | uniq -c | sort -rn | awk -F ' ' '{print $2}' | head -10)

# For every ip, we curl to find its country, and then we print on screen i
# each ip with its country, in the correct order.

for ip in $results
do
	country=$(echo $ip | xargs -I {} curl -s "https://ipapi.co/{}/country/")
        echo -e "$ip \u279E $country"	# '\u279E' is the unicode for the right arrow, used with the parameter '-e'.
done
