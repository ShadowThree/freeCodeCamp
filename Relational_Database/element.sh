#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

if [[ -z $1 ]]
then
	echo "Please provide an element as an argument."
	exit
fi

find_by_number() {
	result=$($PSQL "select name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius from properties inner join elements using(atomic_number) inner join types using(type_id) where atomic_number=$1;")
    if [[ $result ]]
    then
        # echo $result
        IFS='|' read -r eName eSymbol eType eMass eMelt eBoil <<< $result
        echo "The element with atomic number $1 is $eName ($eSymbol). It's a $eType, with a mass of $eMass amu. $eName has a melting point of $eMelt celsius and a boiling point of $eBoil celsius."
    else
        echo "I could not find that element in the database."
    fi
    exit
}

find_by_str() {
    # find by symbol
    result=$($PSQL "select atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius from properties inner join elements using(atomic_number) inner join types using(type_id) where symbol='$1';")
    if [[ $result ]]
    then
        # echo $result
        IFS='|' read -r eNumber eName eSymbol eType eMass eMelt eBoil <<< $result
        echo "The element with atomic number $eNumber is $eName ($eSymbol). It's a $eType, with a mass of $eMass amu. $eName has a melting point of $eMelt celsius and a boiling point of $eBoil celsius."
        exit
    fi

    # find by name
    result=$($PSQL "select atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius from properties inner join elements using(atomic_number) inner join types using(type_id) where name='$1';")
    if [[ $result ]]
    then
        # echo $result
        IFS='|' read -r eNumber eName eSymbol eType eMass eMelt eBoil <<< $result
        echo "The element with atomic number $eNumber is $eName ($eSymbol). It's a $eType, with a mass of $eMass amu. $eName has a melting point of $eMelt celsius and a boiling point of $eBoil celsius."
        exit
    fi

    echo "I could not find that element in the database."
    exit
}

if [[ $1 =~ ^[0-9]+$ ]]
then
    # is number
    find_by_number $1    
else
    # is string
    find_by_str $1
    exit

    allSymbol=$($PSQL "select symbol from elements;")
    # echo $allSymbol
    if [[ $allSymbol =~ "$1" ]]
    then
        find_by_symbol $1
        exit
    fi
fi

result=$($PSQL "select atomic_number from elements;")
echo "$result"
exit


result=$($PSQL "select * from elements where symbol='$1';")
if [[ $result ]]
then
    echo "symbol($1) $result"
    exit
fi

result=$($PSQL "select * from elements where name='$1';")
if [[ $result ]]
then
    echo "name($1) $result"
    exit
fi

