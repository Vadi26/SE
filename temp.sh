# # read marks

# # total_marks=0
# # total_marks=$((total_marks + marks))

# # echo total_marks

# #!/bin/bash

# # Prompt the user to enter 5 space-separated integers
# echo "Enter 5 space-separated integers: "
# read input

# # Split the input into an array based on spaces
# IFS=" " read -ra numbers <<< "$input"

# # Loop through the array, add 1 to each number, and print the result
# for number in "${numbers[@]}"; do
#   # Use arithmetic expansion to perform the addition
#   result=$((number + 1))
#   echo "Original: $number, After adding 1: $result"
# done


#!/bin/bash

#!/bin/bash

echo "Enter marks for each subject (separated by spaces):"
read input

# Read marks into an array
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
echo "Result using case: $result"
