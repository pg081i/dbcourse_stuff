#!/bin/bash

# Set the PSQL variable
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Request username
echo -e "\nEnter your username:"
read UNAME

# PART 1: USER IDENTIFICATION

# Get existing userdata from the 'players' table
USER_RESULT=$($PSQL "SELECT username FROM players WHERE username='$UNAME'")

# Check if user is found
if [[ -z $USER_RESULT ]]; then
    # NOT FOUND: Greet user and add new entry to the 'players' table
    echo -e "\nWelcome, $UNAME! It looks like this is your first time here.\n"
    INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO players(username) VALUES ('$UNAME')")
else
    # FOUND: Get the number of games played and the best game from the 'games' table
    GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games LEFT JOIN players USING(user_id) WHERE username='$UNAME'")
    BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games LEFT JOIN players USING(user_id) WHERE username='$UNAME'")

    echo "Welcome back, $UNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# PART 2: NUMBER GUESSING

# Get random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# Variable to store the number of tries
GUESS_COUNT=0

echo "Guess the secret number between 1 and 1000:"
read USER_GUESS

# Guessing loop
while [[ $USER_GUESS -ne $SECRET_NUMBER ]]; do

    if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]; then
        echo -e "\nThat is not an integer, guess again:"
    else

        if [[ $USER_GUESS -gt $SECRET_NUMBER ]]; then
            echo "It's lower than that, guess again:"
        else
            echo "It's higher than that, guess again:"
        fi

        ((GUESS_COUNT++))
    fi
    read USER_GUESS
done

((GUESS_COUNT++))

# PART 3: USER RESULTS

USER_ID_RESULT=$($PSQL "SELECT user_id FROM players WHERE username='$UNAME'")
INSERT_RESULT=$($PSQL "INSERT INTO games(user_id, secret_number, number_of_guesses) VALUES ($USER_ID_RESULT, $SECRET_NUMBER, $GUESS_COUNT)")

echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
