#!/bin/bash

#This is the third shell script that makes the previous folder
#we created so that any user can write files into public directories
#no user other than the owner can create files, or list the contents
#any user can execute the files

chmod o+r vehicles
cd vehicles
chmod 766 public_bicycles
chmod 766 public_cars
chmod 766 public_planes
chmod 711 bicycles
chmod 711 cars
chmod 711 planes
