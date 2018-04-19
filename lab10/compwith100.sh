#!/bin/bash
a='[:alpha:]'

if [[ $(echo $1 | grep -E '[a-z]+') ]]
then
    exit 1
fi

#----------------------

if [[ "$1" == '' ]]
then
   exit 1
fi

#----------------------

if [[ "$1" -lt 100 ]]
then
     echo "The provided number is less than 100"

elif [[ "$1" -eq 100 ]]
then
     echo "The provided number is equal to 100"

elif [[ "$1" -gt 100 ]]
then
     echo "The provided number is greater than 100"
else
    exit 1
fi
