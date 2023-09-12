#!/bin/bash

echo "Enter the name of the file that you want to read : "
read filename

# Check if the file exists
if [ ! -f "$filename" ]; then
  echo "Error: The file '$filename' does not exist."
  exit 1
fi

file=$(cat $filename.txt)

for line in $file
do
echo -e "$line\n"
done