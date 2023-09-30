#!/bin/bash

displayResult() {
    marks=("$@")
    count=0
    total=0

    for mark in "${marks[@]}"; do
        total=$(bc -l <<< "$total + $mark")
        count=$((count + 1))
    done

    percentage=$(bc -l <<< "scale=2; ($total / ($count * 100)) * 100")

    if (( $(bc <<< "$percentage > 80") == 1 )); then
        echo "i-division"
    elif (( $(bc <<< "$percentage > 60") == 1 )); then
        echo "ii-division"
    elif (( $(bc <<< "$percentage > 40") == 1 )); then
        echo "iii-division"
    else
        echo "iv-division"
    fi
}

while true; do
    echo "Menu:"
    echo "1. Calculate Division"
    echo "2. Exit"

    read -p "Enter your choice: " choice

    if [ "$choice" -eq 1 ]; then
        read -p "Enter the number of subjects: " i

        if [ "$i" -lt 0 ]; then
            echo "No. of subjects cannot be negative!"
            continue
        fi

        if [ "$i" -gt 10 ]; then
            echo "No. of subjects cannot be greater than 10!"
            continue
        fi

        echo "Enter the marks for each subject:"
        marks=()
        for ((j = 1; j <= i; j++)); do
            read -p "Enter marks for subject $j: " mark

            if (( $(bc <<< "$mark < 0") == 1 )); then
                echo "Marks cannot be negative! Please give proper input."
                j=$((j - 1))
                continue
            fi

            if (( $(bc <<< "$mark > 100") == 1 )); then
                echo "Marks cannot be greater than 100! Please give proper input."
                j=$((j - 1))
                continue
            fi

            marks+=("$mark")
        done

        result=$(displayResult "${marks[@]}")
        echo "Result: $result"
    elif [ "$choice" -eq 2 ]; then
        break
    else
        echo "Invalid choice. Please select a valid option."
    fi
done