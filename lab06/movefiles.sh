#!/bin/bash

#This script will move files from public directory to non-public directory
cd vehicles
mkdir -p non_public
mv *public_* non_public 2> /dev/null
