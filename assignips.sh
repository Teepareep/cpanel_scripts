#!/bin/bash
# shell script to help assign accounts to the main shared IP address
# written by Nick Teeple
# version .01
#

for i in $(/scripts/ipusage | awk '{print$1}' | sed '1,2d')
do
	#This sed line needs to be adjusted to look for the current ADDR instead of just doing the first line
    echo "sed -i '1s/.*/ADDR $i/' /etc/wwwacct.conf"
    for j in $( /scripts/ipusage | cut -d" " -f1,3 | sed "s/,/ /g" | sed "s/]//g" | grep $i | sed 's/\s/\n/g' | sed 1d )
    do
           echo "/usr/local/cpanel/bin/setsiteip -u $user `/scripts/whoowns $j` $i"
    done
  echo "" #### print the new line ###
done
