#!/bin/bash

# Author : Gabriel Duarte
# This script will take the first argument passed and will perform a search
# on files that were downloaded, as well as print the number of lines where
# were the input words appear

echo "The first arugment you entered is: " $1
grep -r $1 | wc -l
