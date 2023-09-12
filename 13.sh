#!/bin/bash

read string

low=0
high=${#string}-1
num=$((low + high))
x=0

if [ -z "$string" ]; then
    echo "It is a palindrome"
else
    for ((i=0; i<=$num; i++)); do
        if [ "${string:i:1}" != "${string:high-i:1}" ]; then
            echo "The given string is not a palindrome !"
            exit 0
        fi
    done

    echo "The given string is a palindrome :)"
fi
