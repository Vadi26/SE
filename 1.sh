#!/bin/sh

ans=$(( $1 - $2 ))

if [ $ans -lt 0 ]
then
    echo "Loss of $ans"
else
    echo "Profit of $ans"
fi
