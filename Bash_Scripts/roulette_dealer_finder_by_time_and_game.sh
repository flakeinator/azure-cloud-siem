#!/bin/bash

#This will return the proper dealer depending on the game. Expected input would be $1 and $2 are time and am/pm. $3 would be the date
# and $4 is the game (Blackjack, Roulette, or Texas_Hold_Em) in this format.

if [[ "$4" == "Blackjack" ]]; then
	grep "$1 $2" $3_Dealer_Schedule | awk '{print $1, $2, $3, $4}'
elif [[ "$4" == "Roulette" ]]; then 
	grep "$1 $2" $3_Dealer_Schedule | awk '{print $1, $2, $5, $6}'
elif [[ "$4" == "Texas_Hold_Em" ]]; then
	grep "$1 $2" $3_Dealer_Schedule | awk '{print $1, $2, $7, $8}'
fi
