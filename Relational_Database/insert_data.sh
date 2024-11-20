#! /bin/bash

if [[ $1 == "test" ]]
then
  # echo worldcuptest
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  # echo worldcup
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo "$($PSQL "truncate teams,games;")"
cat games.csv | while IFS=',' read year round winner opponent winner_goals opponent_goals
do
  # echo $year,$round,$winner,$opponent,$winner_goals,$opponent_goals
  # continue
  # ignore the title line
  if [[ $year == 'year' ]]; then continue; fi

  # insert the winner if NOT exist in teams
  winner_id=$($PSQL "select team_id from teams where name = '$winner';")
  if [[ -z $winner_id ]]
  then
    insert_result=$($PSQL "insert into teams(name) values('$winner');")
    if [[ $insert_result == 'INSERT 0 1' ]]
    then
      winner_id=$($PSQL "select team_id from teams where name = '$winner';")
    else
      echo "#### insert err[$insert_result] ####"
      echo $year,$round,$winner,$opponent,$winner_goals,$opponent_goals
    fi
  fi

  # insert the opponent if NOT exist in teams
  opponent_id=$($PSQL "select team_id from teams where name = '$opponent';")
  if [[ -z $opponent_id ]]
  then
    insert_result=$($PSQL "insert into teams(name) values('$opponent');")
    if [[ $insert_result == 'INSERT 0 1' ]]
    then
      opponent_id=$($PSQL "select team_id from teams where name = '$opponent';")
    fi
  fi

  # insert info to games
  insert_result=$($PSQL "insert into games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) values($year,'$round',$winner_id,$opponent_id,$winner_goals,$opponent_goals);")
  if [[ $insert_result != 'INSERT 0 1' ]] 
  then
    echo $year,$round,$winner_id,$winner,$opponent_id,$opponent,$winner_goals,$opponent_goals
  fi
done