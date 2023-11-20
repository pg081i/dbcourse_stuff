#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

# Check for inputs
if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit 
fi

# if parameter is not a number (e.g., H or Hydrogen)
if [[ ! $1 =~ ^[0-9]+$ ]]; then

  ELEMENT_PROPS=$($PSQL "SELECT atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name, t.type FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types as t USING(type_id) WHERE symbol = '$1' OR name = '$1'")
  
  if [[ -z $ELEMENT_PROPS ]]; then

    echo "I could not find that element in the database."
    exit
  fi
  
  echo "$ELEMENT_PROPS" | while IFS="|" read ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS SYMBOL NAME TYPE
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
  done

# if parameter is a number (e.g., 42)
else
  ELEMENT_PROPS=$($PSQL "SELECT atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name, t.type FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types as t USING(type_id) WHERE atomic_number = $1 ")  
  
  if [[ -z $ELEMENT_PROPS ]]; then

    echo "I could not find that element in the database."
    exit
  fi

  echo "$ELEMENT_PROPS" | while IFS="|" read ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS SYMBOL NAME TYPE
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
  done

fi
