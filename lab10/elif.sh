#!/bin/bash

x=12

if [ "$x" -lt 10 ]
then
    echo "x is less than 10"
elif [ "$x" -lt 25 ]
then
    echo "x is greater than 10 but less than 25"
else
    echo "x is greater than or equal 25"
    fi
