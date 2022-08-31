#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

echo $($PSQL "TRUNCATE teams, games")

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    if [[ -z $WINNER_ID ]]
    then
      INSERT_WINNER_ID_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")

      if [[ $INSERT_WINNER_ID_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER
      fi
    fi

    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_OPPONENT_ID_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")

      if [[ $INSERT_OPPONENT_ID_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $OPPONENT
      fi
    fi

    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES('$YEAR', '$ROUND', '$WINNER_GOALS', '$OPPONENT_GOALS', '$WINNER_ID', '$OPPONENT_ID')")

    if [[ $INSERT_OPPONENT_ID_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into games new game from round $ROUND, $YEAR. Score was $WINNER: $WINNER_GOALS - $OPPONENT: $OPPONENT_GOALS.
    fi
  fi
done
