#!/bin/bash
calculate_division() {
    local total=0
    local count=0

    for mark in "${marks[@]}"; do
        if ((mark >= 0 && mark <= 100)); then
            total=$((total + mark))
            count=$((count + 1))
        else
            echo "Error: Invalid input for marks. Please enter valid numbers between 0 and 100."
            exit 1
        fi
    done

    if ((count == 0)); then
        echo "Error: No valid marks entered. Please enter marks between 0 and 100."
        exit 1
    fi

    local percentage=$(echo "scale=2; $total / ($count * 100) * 100" | bc)

    if (( $(echo "$percentage > 80" | bc -l) )); then
        division="i-division"
    elif (( $(echo "$percentage > 60" | bc -l) )); then
        division="ii-division"
    elif (( $(echo "$percentage > 40" | bc -l) )); then
        division="iii-division"
    else
        division="iv-division"
    fi

    echo "$division"
}

while true; do
    read -p "Enter the number of students: " num_students

    if ((num_students < 1)); then
        echo "Please enter a valid number of students (at least 1)."
        continue
    fi

    students=()

    for ((i = 1; i <= num_students; i++)); do
        read -p "Enter the name of student $i: " student_name

        while true; do
            read -p "Enter the number of subjects for $student_name: " num_subjects

            if ((num_subjects >= 1 && num_subjects <= 10)); then
                break
            else
                echo "Number of subjects should be between 1 and 10."
            fi
        done

        marks=()

        for ((j = 1; j <= num_subjects; j++)); do
            while true; do
                read -p "Enter marks for subject $j for $student_name: " mark

                if ((mark >= 0 && mark <= 100)); then
                    marks+=("$mark")
                    break
                else
                    echo "Marks should be between 0 and 100."
                fi
            done
        done

        division=$(calculate_division)
        students+=("$student_name $division")
    done

    # Display the results in a tabular format
    echo -e "\nStudent\tDivision"
    for student in "${students[@]}"; do
        echo "$student"
    done

    break
done






































# #!/bin/bash

# echo "Enter marks for each subject (separated by spaces):"
# read input

# read -ra marks <<< "$input"

# total_marks=0
# count=0
# for mark in "${marks[@]}"; do
#   total_marks=$((total_marks + mark))
#   count=$((count + 1))
# done

# percentage=$((total_marks / count))

# case $percentage in
#   [0-4][0-4])
#     result="Fail"
#     ;;
#   [4-5][5-9])
#     result="III-Division"
#     ;;
#   [6-7][0-4])
#     result="II-Division"
#     ;;
#   [7-9][5-9]|100)
#     result="I-Division"
#     ;;
#   *)
#     result="Invalid Input"
#     ;;
# esac

# # Display the result
# echo "Result: $result"