#!/bin/bash

isvalid=`cat /usr/share/dict/words | grep -E ^$1$`


if [[ $isvalid ]]
then
    exit 0
elif [[ $isvalid != true ]]
then
    exit 1
fi
echo $isvalid
