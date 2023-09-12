#!/bin/bash

year=2000

count=0

echo "List of 10 leap years starting from 2000 : "

while [ $count -lt 10 ]; do
  if (( (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0) )); then
    echo $year
    ((count++))
  fi

  ((year++))
done
