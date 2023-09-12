# read marks

# total_marks=0
# total_marks=$((total_marks + marks))

# echo total_marks

#!/bin/bash

# Prompt the user to enter 5 space-separated integers
echo "Enter 5 space-separated integers: "
read input

# Split the input into an array based on spaces
IFS=" " read -ra numbers <<< "$input"

# Loop through the array, add 1 to each number, and print the result
for number in "${numbers[@]}"; do
  # Use arithmetic expansion to perform the addition
  result=$((number + 1))
  echo "Original: $number, After adding 1: $result"
done
