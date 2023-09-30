#!/bin/bash

perform() {
    op1=$1
    op=$2
    op2=$3

    if [ "$op" == "+" ]; then
        result=$(bc -l <<< "$op1 + $op2")
    elif [ "$op" == "-" ]; then
        result=$(bc -l <<< "$op1 - $op2")
    elif [ "$op" == "*" ]; then
        result=$(bc -l <<< "$op1 * $op2")
    elif [ "$op" == "/" ]; then
        if (( $(bc <<< "$op2 != 0") == 1 )); then
            result=$(bc -l <<< "$op1 / $op2")
        else
            echo "Division by zero error !"
            return
        fi
    else
        echo "No valid operation entered :("
        return
    fi

    echo "Result: $result"
}

while true; do
    echo "1 - Perform operation"
    echo "2 - Quit"
    read -p "Enter your choice: " choice

    if [ "$choice" == '2' ]; then
        break
    elif [ "$choice" == '1' ]; then
        try_again=true
        while [ "$try_again" == true ]; do
            read -p "Operand 1: " op1
            read -p "Operator: " op

            if [[ "$op" =~ ^[+\-*/]$ ]]; then
                echo "Enter a proper operator (+, -, *, /)!"
                continue
            fi

            read -p "Operand 2: " op2

            if ! [[ "$op1" =~ ^[+-]?[0-9]*\.?[0-9]+$ ]] || ! [[ "$op2" =~ ^[+-]?[0-9]*\.?[0-9]+$ ]]; then
                echo "Input not in proper format! Please enter valid numeric operands."
                continue
            fi

            perform "$op1" "$op" "$op2"
            try_again=false
        done
    else
        echo "Enter proper input (1 or 2)!"
    fi
done
