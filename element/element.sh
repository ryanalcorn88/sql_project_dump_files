#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    CHECK_ATOMIC_NUMBER=$($PSQL "select symbol from elements where atomic_number = $1")
  else
    CHECK_SYMBOL=$($PSQL "select atomic_number from elements where symbol = '$1'")
    CHECK_NAME=$($PSQL "select atomic_number from elements where name = '$1'")
  fi

  if [[ -z $CHECK_ATOMIC_NUMBER && -z $CHECK_SYMBOL && -z $CHECK_NAME ]]
  then
    echo -e "I could not find that element in the database."
  else
    if [[ $CHECK_ATOMIC_NUMBER ]]
    then
      ATOMIC_NUMBER=$1
      SYMBOL=$($PSQL "select symbol from elements where atomic_number = $1")
      SYMBOL_FORMATTED=$(echo $SYMBOL | sed 's/ |/"/')
      NAME=$($PSQL "select name from elements where atomic_number = $1")
      NAME_FORMATTED=$(echo $NAME | sed 's/ |/"/')
    elif [[ $CHECK_SYMBOL ]]
    then
      ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where symbol = '$1'")
      SYMBOL_FORMATTED=$(echo $1 | sed 's/ |/"/')
      NAME=$($PSQL "select name from elements where symbol = '$1'")
      NAME_FORMATTED=$(echo $NAME | sed 's/ |/"/')
    else
      ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where name = '$1'")
      SYMBOL=$($PSQL "select symbol from elements where name = '$1'")
      SYMBOL_FORMATTED=$(echo $SYMBOL | sed 's/ |/"/')
      NAME=$1
      NAME_FORMATTED=$(echo $NAME | sed 's/ |/"/')
    fi

    TYPE=$($PSQL "select type from types inner join properties on properties.type_id=types.type_id where atomic_number = $ATOMIC_NUMBER")
    TYPE_FORMATTED=$(echo $TYPE | sed 's/ |/"/')
    MASS=$($PSQL "select atomic_mass from properties where atomic_number=$ATOMIC_NUMBER")
    MASS_FORMATTED=$(echo $MASS | sed 's/ |/"/')
    BOILING_POINT=$($PSQL "select boiling_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
    BOILING_POINT_FORMATTED=$(echo $BOILING_POINT | sed 's/ |/"/')
    MELTING_POINT=$($PSQL "select melting_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
    MELTING_POINT_FORMATTED=$(echo $MELTING_POINT | sed 's/ |/"/')

    ATOMIC_NUMBER_FORMATTED=$(echo $ATOMIC_NUMBER | sed 's/ |/"/')
    echo -e "The element with atomic number $ATOMIC_NUMBER_FORMATTED is $NAME_FORMATTED ($SYMBOL_FORMATTED). It's a $TYPE_FORMATTED, with a mass of $MASS_FORMATTED amu. $NAME_FORMATTED has a melting point of $MELTING_POINT_FORMATTED celsius and a boiling point of $BOILING_POINT_FORMATTED celsius."
  fi
fi
