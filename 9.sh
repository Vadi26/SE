#!/bin/bash

read filename

if [ -f "$filename.txt" ];
then
echo "File Exists !....Writing contents"
echo -n "hello world" | cat >> $filename.txt
else
echo "File does not exist :(....Creating one ;)"
echo -n "hello world" | cat > $filename.txt
fi