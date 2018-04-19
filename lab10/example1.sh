#!/bin/bash

a="foo"
b=bar
c=$HOME
d=0123
e=`ls -l | grep -e "^[^t]" | wc -l`
f=$((2*3))

echo $a
echo $b
echo $c
echo $d
echo $e
echo $f
