#!/bin/bash

# This script allows users to guess a randomly generated number between 1 and 1000.
# It tracks the number of guesses, interacts with a PostgreSQL database, and updates user stats.

# PSQL command for connecting to the database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Prompt user for their username
echo "Enter your username:"
read USERNAME

# Check if the username already exists in the database
USER_DATA=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_DATA ]]; then
  # If the username doesn't exist, insert them into the database
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  $PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 0, NULL)"
else
  # If the username exists, fetch the user data
  IFS="|" read USER_ID GAMES_PLAYED BEST_GAME <<< "$USER_DATA"
  
  # Print welcome message for returning users
  if [[ -z $BEST_GAME || $BEST_GAME -eq 0 ]]; then
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, but haven't guessed the number yet."
  else
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
fi

# Increase guess count before checking if it's correct
# Generate a secret number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
echo "Guess the secret number between 1 and 1000:"

# Initialize guess count
GUESS_COUNT=0

# Loop to take guesses from the user
while true; do
  read GUESS

  # Check if the input is an integer
  if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  ((GUESS_COUNT++))

  # Compare the guess with the secret number
  if [[ $GUESS -lt $SECRET_NUMBER ]]; then
    echo "It's higher than that, guess again:"
  elif [[ $GUESS -gt $SECRET_NUMBER ]]; then
    echo "It's lower than that, guess again:"
  else
    # User guessed correctly
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"

    # Update user data in the database
    if [[ -z $USER_DATA ]]; then
      # First-time user, set games played and best game
      $PSQL "UPDATE users SET games_played = 1, best_game = $GUESS_COUNT WHERE username = '$USERNAME'"
    else
      # Returning user, update games played and best game if improved
      ((GAMES_PLAYED++))
      if [[ -z $BEST_GAME || $GUESS_COUNT -lt $BEST_GAME ]]; then
        $PSQL "UPDATE users SET games_played = $GAMES_PLAYED, best_game = $GUESS_COUNT WHERE username = '$USERNAME'"
      else
        $PSQL "UPDATE users SET games_played = $GAMES_PLAYED WHERE username = '$USERNAME'"
      fi
    fi
    break
  fi
done
