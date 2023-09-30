#!/bin/bash

isEven() {
    number=$1

    if [ "$((number % 2))" -eq 0 ]; then
        return 0
    else
        return 1
    fi
}

while true; do
    echo "Do you want to enter another number? (1-yes / 0-no)"
    read -p "Enter your choice: " x

    if [ "$x" -eq 1 ]; then
        read -p "Enter the number: " number

        if ! [[ "$number" =~ ^[0-9]+$ ]]; then
            echo "Invalid input: Please enter a valid integer."
            continue
        fi

        if isEven "$number"; then
            echo "$number is Even."
        else
            echo "$number is Odd."
        fi
    elif [ "$x" -eq 0 ]; then
        break
    else
        echo "Invalid choice. Please select 1 (yes) or 0 (no)."
    fi
done
