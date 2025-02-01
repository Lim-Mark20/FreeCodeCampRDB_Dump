#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"
SECRET_NUMBER=$((1 + $RANDOM % 1000))
echo "Enter your username:"
read USERNAME
USERNAME_RESULT=$($PSQL "SELECT games_played, best_game FROM users WHERE username = '$USERNAME'")
if [[ -z $USERNAME_RESULT ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  GAMES_PLAYED=0
  BEST_GAME=9999
else
  read GAMES_PLAYED BAR BEST_GAME <<< $USERNAME_RESULT
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
echo "Guess the secret number between 1 and 1000:"
NUMBER_OF_GUESSES=0
GUESS=0
while [[ $GUESS -ne $SECRET_NUMBER ]]; do
  read GUESS
  #Invalid input
  if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
  else
    NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
    if (( $GUESS > $SECRET_NUMBER )); then
      echo "It's lower than that, guess again:"
    elif (( $GUESS < $SECRET_NUMBER )); then
      echo "It's higher than that, guess again:"
    fi
  fi
done
echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
if [[ -z $USERNAME_RESULT ]]; then
  #Insert user data for first-time players
  INSERT_RESULT=$($PSQL "INSERT INTO users (username, games_played, best_game) VALUES ('$USERNAME', 1, $NUMBER_OF_GUESSES)")
else
  UPDATE_GAMES=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username = '$USERNAME'")
  if (( $NUMBER_OF_GUESSES < $BEST_GAME )); then
    UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE username = '$USERNAME'")
  fi
fi