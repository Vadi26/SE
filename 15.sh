#!/bin/bash

function are_file_contents_equal() {
    local file1="$1"
    local file2="$2"
    file1="${file1}.txt"
    file2="${file2}.txt"

    if [[ -e "$file1" && -e "$file2" ]]; then
        content1=$(<"$file1")
        content2=$(<"$file2")

        if [[ "$content1" == "$content2" ]]; then
            echo "true"
        else
            echo "false"
        fi
    else
        echo "Error: One or both files not found."
    fi
}

while true; do
    echo -e "\nFile Content Comparison Menu:"
    echo "1. Check if contents of two files are the same"
    echo "2. Quit"

    read -p "Enter your choice (1/2): " choice

    if [[ "$choice" == '1' ]]; then
        read -p "Enter the name of the first file: " file1
        read -p "Enter the name of the second file: " file2

        result=$(are_file_contents_equal "$file1" "$file2")
        if [[ "$result" == "true" ]]; then
            echo "The contents of the two files are the same."
        elif [[ "$result" == "false" ]]; then
            echo "The contents of the two files are different."
        else
            echo "$result"
        fi

    elif [[ "$choice" == '2' ]]; then
        echo "Exiting the program."
        break

    else
        echo "Invalid choice. Please select a valid option (1/2)."
    fi
done
