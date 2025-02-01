#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USER_DATA=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_DATA ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  $PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 0, NULL)"
else
  IFS="|" read USER_ID GAMES_PLAYED BEST_GAME <<< "$USER_DATA"
  # Handling both NULL and valid best_game values
  if [[ -z $BEST_GAME || $BEST_GAME -eq 0 ]]; then
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, but haven't guessed the number yet."
  else
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
fi

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
echo "Guess the secret number between 1 and 1000:"
GUESS_COUNT=0

while true; do
  read GUESS

  if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  ((GUESS_COUNT++))

  if [[ $GUESS -lt $SECRET_NUMBER ]]; then
    echo "It's higher than that, guess again:"
  elif [[ $GUESS -gt $SECRET_NUMBER ]]; then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
    
    # If first-time user or best game improvement
    if [[ -z $USER_DATA ]]; then
      $PSQL "UPDATE users SET games_played = 1, best_game = $GUESS_COUNT WHERE username = '$USERNAME'"
    else
      ((GAMES_PLAYED++))
      # If the user has improved their best game, update it
      if [[ -z $BEST_GAME || $GUESS_COUNT -lt $BEST_GAME ]]; then
        $PSQL "UPDATE users SET games_played = $GAMES_PLAYED, best_game = $GUESS_COUNT WHERE username = '$USERNAME'"
      else
        $PSQL "UPDATE users SET games_played = $GAMES_PLAYED WHERE username = '$USERNAME'"
      fi
    fi
    break
  fi
done
