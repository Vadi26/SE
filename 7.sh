#!/bin/bash

function largest() {
    if (( $1 > $2 )); then
        if (( $1 > $3 )); then
            echo $1
        else
            echo $3
        fi
    else
        if (( $2 > $3 )); then
            echo $2
        else
            echo $3
        fi
    fi
}

while true; do
    echo -e "\nMenu:"
    echo "1. Find the largest number"
    echo "2. Quit"

    read -p "Select an option (1/2): " choice

    if [[ $choice == "2" ]]; then
        echo "Exiting the program. Goodbye!"
        break
    fi

    if [[ $choice != "1" ]]; then
        echo "Invalid choice. Please select a valid option."
        continue
    fi

    read -p "Enter 1st number: " num1
    read -p "Enter 2nd number: " num2
    read -p "Enter 3rd number: " num3

    if [[ ! "$num1" =~ ^[0-9]*(\.[0-9]+)?$ || ! "$num2" =~ ^[0-9]*(\.[0-9]+)?$ || ! "$num3" =~ ^[0-9]*(\.[0-9]+)?$ ]]; then
        echo "Input not in proper format. Please enter valid numbers."
        continue
    fi

    largest_number=$(largest "$num1" "$num2" "$num3")
    echo "Largest number is: $largest_number"
done
