#!/bin/bash

echo "Enter marks for each subject (separated by spaces):"
read marks

total_marks=0
count=0
for mark in $marks; do
  total_marks=$((total_marks + mark))
  count=$((count + 1))
done

percentage=$((total_marks / count))

case $percentage in
  >=0 && <= 44)
    result="Fail"
    ;;
  >=45 && <= 59)
    result="III-Division"
    ;;
  >=60 && <= 74)
    result="II-Division"
    ;;
  >=75 && <=100])
    result="I-Division" 
    ;;
  *)
    result="Invalid Input"
    ;;
esac

# Display the result
echo "Result: $result"

