#!/bin/bash

#This will find who was working as a dealer for Roulette at a specific date and time. The format for the 
#time is XX:XX:XX AM/PM and the format for the date is MMDD.
grep -i "$1 $2" $3_Dealer_Schedule | awk '{print $1, $2, $5, $6}'
