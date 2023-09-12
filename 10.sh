#!/bin/bash

read directory
if [ -d "$directory" ]
then
echo "Directory already exists !"
else
echo "Directory does not exist. Making one for you !"
mkdir $directory
fi