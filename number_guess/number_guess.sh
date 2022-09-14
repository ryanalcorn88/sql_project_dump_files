#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$((1 + $RANDOM % 1000))
GUESS_COUNTER=1

echo "Enter your username:"
read USERNAME

CHECK_FOR_USERNAME=$($PSQL "select user_id from users where name = '$USERNAME'")

if [[ -z $CHECK_FOR_USERNAME ]]
then
  echo -e "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "select number_of_games from users where name = '$USERNAME'")
  BEST_GAME=$($PSQL "select best_game from users where name = '$USERNAME'")

  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo -e "\nGuess the secret number between 1 and 1000:"
read CURRENT_GUESS

while [[ $CURRENT_GUESS != $RANDOM_NUMBER ]]
do
  while [[ ! $CURRENT_GUESS =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read CURRENT_GUESS
  done

  if [[ $CURRENT_GUESS < $RANDOM_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    read CURRENT_GUESS
  elif [[ $CURRENT_GUESS > $RANDOM_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    read CURRENT_GUESS
  fi

  GUESS_COUNTER=$((GUESS_COUNTER + 1))
done

echo -e "\nYou guessed it in $GUESS_COUNTER tries. The secret number was $RANDOM_NUMBER. Nice job!"

if [[ -z $CHECK_FOR_USERNAME ]]
then
  INSERT_NEW_USER=$($PSQL "insert into users(name, number_of_games, best_game) values('$USERNAME', 1, $GUESS_COUNTER)")
else
  if [[ $GUESS_COUNTER < $BEST_GAME ]]
  then
    UPDATE_BEST_GAME=$($PSQL "update users set best_game=$GUESS_COUNTER where name='$USERNAME'")
  fi

  GAMES_PLAYED=$((GAMES_PLAYED + 1))
  UPDATE_GAMES_PLAYED=$($PSQL "update users set number_of_games=$GAMES_PLAYED where name='$USERNAME'")
fi
