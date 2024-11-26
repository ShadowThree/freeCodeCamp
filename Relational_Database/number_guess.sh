#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c"

guessCnt=0
minCnt=0
secNum=$((RANDOM % 1000 + 1))
# echo $secNum

play_game() {
    echo -n "Guess the secret number between 1 and 1000:"
    while true;
    do
        read num
        guessCnt=$(($guessCnt+1))
        if [[ ! $num =~ ^[0-9]+$ ]]
        then
            echo -n "That is not an integer, guess again:"
            continue
        fi
	if (( $num < $secNum )) 
        then
            # echo -n "It's higher than that, guess again:"
            echo -n "It's higher than that, guess again:"
            continue
    	elif (( $num > $secNum ))
        then
            echo -n "It's lower than that, guess again:"
            continue
        else
            echo "You guessed it in $guessCnt tries. The secret number was $secNum. Nice job!"
            if [[ $2 ]]
            then
                if [[ $3 -le $guessCnt ]]
                then
                    minCnt=$3
                else
                    minCnt=$guessCnt
                fi
                # echo $minCnt
                updateR=$($PSQL "update users set total_play=total_play+1,min_cnt=$minCnt where name='$1';")
                exit
            else
                insertR=$($PSQL "insert into users(name,total_play,min_cnt) values('$1',1,$guessCnt);")
                if [[ $insertR != "INSERT 0 1" ]]; then echo "insert err"; fi
                exit
            fi
        fi
    done
}

# read -p "Enter your username:" username	# can't pass
echo -n "Enter your username:" 
read username

result=$($PSQL "select total_play,min_cnt from users where name='$username';")
if [[ $result ]]
then
    IFS='|' read totalPlay minCnt <<< $result
    echo "Welcome back, $username! You have played $totalPlay games, and your best game took $minCnt guesses."
    play_game $username $totalPlay $minCnt
else
    echo "Welcome, $username! It looks like this is your first time here."
    play_game $username
fi

