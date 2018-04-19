#!/bin/bash

x=`echo $1 | grep -E '^[A-Z]{3}(-)[0-9]{4}(-)[ABCD]$'`

if [[ $x ]]
then
    exit 0
else
    exit 1
fi
