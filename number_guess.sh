#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$((1 + $RANDOM % 1000)); 
NUMBER_OF_GUESSES=0

echo -e "Enter your username: \n"
read USERNAME_INPUT

USERNAME_QUERY=$($PSQL "SELECT username, games_played, best_game FROM username WHERE username = '$USERNAME_INPUT'")

if [[ $USERNAME_QUERY ]] 
  then
  echo $USERNAME_QUERY | cat | while IFS='|' read USERNAME GAMES_PLAYED BEST_GAME
    do
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
  else 
  USERNAME_QUERY=$($PSQL "INSERT INTO username (username) VALUES ('$USERNAME_INPUT')")
  echo -e "\nWelcome, $USERNAME_INPUT! It looks like this is your first time here."
fi

echo -e "\nGuess the secret number between 1 and 1000:"

function GUESSING_GAME() {
  read USER_GUESS
  # echo "Random number is: $RANDOM_NUMBER"
  if [[ ! $USER_GUESS =~ [0-9] ]] 
    then
    echo -e "\nThat is not an integer, guess again:"
  elif [[ $USER_GUESS > $RANDOM_NUMBER ]] 
    then
    echo -e "\nIt's lower than that, guess again:\n"
  elif [[ $USER_GUESS < $RANDOM_NUMBER ]]
    then
    echo -e "\nIt's higher than that, guess again:\n"
  fi

  NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))

  if [[ $USER_GUESS == $RANDOM_NUMBER ]]
    then
    echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
    QUERY_GAME_COMPLETE=$($PSQL "UPDATE username SET games_played = games_played + 1, best_game = LEAST(best_game, $NUMBER_OF_GUESSES) WHERE username = '$USERNAME_INPUT'")
    else 
    GUESSING_GAME
  fi
}

GUESSING_GAME
