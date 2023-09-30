#!/bin/bash

echo "Enter marks for each subject (separated by spaces):"
read input

read -ra marks <<< "$input"

total_marks=0
count=0
for mark in "${marks[@]}"; do
  total_marks=$((total_marks + mark))
  count=$((count + 1))
done

percentage=$((total_marks / count))

case $percentage in
  [0-4][0-4])
    result="Fail"
    ;;
  [4-5][5-9])
    result="III-Division"
    ;;
  [6-7][0-4])
    result="II-Division"
    ;;
  [7-9][5-9]|100)
    result="I-Division"
    ;;
  *)
    result="Invalid Input"
    ;;
esac

# Display the result
echo "Result: $result"

