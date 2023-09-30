#!/bin/bash

calculate_profit_loss() {
    cp=$1
    sp=$2

    if (( $(bc <<< "$cp == 0") == 1 )); then
        echo "Invalid input: Cost price cannot be zero"
        return
    fi

    if (( $(bc <<< "$cp > $sp") == 1 )); then
        result_type="Loss"
        amount=$(bc <<< "$cp - $sp")
        percentage=$(bc <<< "scale=2; (($cp - $sp) / $cp) * 100")
    elif (( $(bc <<< "$cp < $sp") == 1 )); then
        result_type="Profit"
        amount=$(bc <<< "$sp - $cp")
        percentage=$(bc <<< "scale=2; (($sp - $cp) / $cp) * 100")
    else
        result_type="No profit No Loss"
        amount=0
        percentage=0
    fi

    echo "$result_type: Amount: $amount, Percentage: $percentage%"
}

while true; do
    echo "1. Calculate Profit/Loss"
    echo "2. Exit"
    read -p "Enter your choice: " choice

    if [ "$choice" == '1' ]; then
        read -p "Enter the cost price: " cp

        if (( $(bc <<< "$cp < 0") == 1 )); then
            echo "Cost price cannot be negative!"
            continue
        fi

        read -p "Enter the selling price: " sp

        if (( $(bc <<< "$cp == 0") == 1 )); then
            echo "Profit amount : $sp"
            echo "Since cost price is 0, percentage cannot be calculated"
        else
            calculate_profit_loss "$cp" "$sp"
        fi
    elif [ "$choice" == '2' ]; then
        break
    else
        echo "Invalid choice. Please select a valid option."
    fi
done
