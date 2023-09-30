#!/bin/bash

is_prime() {
    number=$1

    if [ "$number" -eq 2 ]; then
        return 0
    fi

    if [ "$((number % 2))" -eq 0 ]; then
        return 1
    fi

    for ((i = 3; i <= number / 2; i++)); do
        if [ "$((number % i))" -eq 0 ]; then
            return 1
        fi
    done

    return 0
}

check_prime() {
    number=$1

    if [ "$number" -le 1 ]; then
        echo "Invalid input: Number should be greater than 1"
        return 1
    fi

    is_prime "$number"
    if [ "$?" -eq 0 ]; then
        return 0
    else
        return 1
    fi
}

while true; do
    echo "1. Check if a number is prime"
    echo "2. Exit"
    read -p "Enter your choice: " choice

    if [ "$choice" -eq 1 ]; then
        read -p "Enter the number: " number

        if [ "$number" -eq 0 ] || [ "$number" -eq 1 ]; then
            echo "$number is neither prime nor composite."
            continue
        fi

        check_prime "$number"
        if [ "$?" -eq 0 ]; then
            echo "$number is a Prime Number."
        else
            echo "$number is not a Prime Number."
        fi
    elif [ "$choice" -eq 2 ]; then
        break
    else
        echo "Invalid choice. Please select a valid option."
    fi
done
