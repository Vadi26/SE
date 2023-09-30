#!/bin/bash

function calculate_factorial() {
    local n="$1"
    if ((n >= 0)); then
        factorial=1
        for ((i=1; i<=n; i++)); do
            factorial=$((factorial * i))
        done
        echo "$factorial"
    else
        echo "Error: Enter a non-negative integer."
    fi
}

while true; do
    echo -e "\nFactorial Calculator Menu:"
    echo "1. Calculate factorial of a number"
    echo "2. Quit"

    read -p "Enter your choice (1/2): " choice

    if [[ "$choice" == '1' ]]; then
        read -p "Enter a non-negative integer: " num_str
        while ! [[ "$num_str" =~ ^[0-9]+$ ]]; do
            echo "Enter a proper integer!"
            read -p "Enter a non-negative integer: " num_str
        done

        num="$num_str"
        result=$(calculate_factorial "$num")

        if [[ "$result" != *"Error"* ]]; then
            echo "The factorial of $num is $result"
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
