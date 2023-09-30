#!/bin/bash

calculate_area_and_circumference() {
    radius=$1
    area=$(bc -l <<< "scale=2; 3.14159265359 * $radius * $radius")
    circumference=$(bc -l <<< "scale=2; 2 * 3.14159265359 * $radius")
    echo "$area $circumference"
}

while true; do
    echo "1. Calculate Area and Circumference"
    echo "2. Exit"
    read -p "Enter your choice: " choice

    if [ "$choice" -eq 1 ]; then
        read -p "Enter the radius: " radius

        if ! [[ "$radius" =~ ^[0-9]*(\.[0-9]+)?$ ]]; then
            echo "Invalid input: Please enter a valid number."
            continue
        fi

        if (( $(bc <<< "$radius <= 0") == 1 )); then
            echo "Radius must be a positive number."
            continue
        fi

        result=$(calculate_area_and_circumference "$radius")
        area=$(echo "$result" | awk '{print $1}')
        circumference=$(echo "$result" | awk '{print $2}')
        echo "Area -> $area"
        echo "Circumference -> $circumference"
    elif [ "$choice" -eq 2 ]; then
        break
    else
        echo "Invalid choice. Please select a valid option."
    fi
done
