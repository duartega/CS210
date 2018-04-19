#!/bin/bash

if [[ $(echo $1 | grep -E [[:blank:]]) ]]
then
    echo 'Please provide a repository name'
    exit 128
fi

if [[ $(echo $1 | grep -E '[a-z]+$') ]]
then
    echo 'Invalid repository name'
    exit 129
fi

if [[ '$1' == [[:alpha:]] ]]
then
    mkdir $1
fi

git config --list

if [[ user.name == ' ' ]]
then
    echo 'Please configure the user.name git global variable'
    exit 130
fi

if [[ user.email == ' ' ]]
then
    echo 'Please configure the user.email git global variable'
    exit 131
fi

git init
git remote add origin https://github.com/$1
git add .
git commit -m $2
git push --set-upstream origin master
