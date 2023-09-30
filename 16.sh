# #!/bin/bash

# while true; do
#     echo -e "\nPyramid Printing Menu:"
#     echo "1. Print a Pyramid of Numbers"
#     echo "2. Print a Pyramid of a Character"
#     echo "3. Quit"

#     read -p "Enter your choice (1/2/3): " choice

#     if [[ "$choice" == '1' ]]; then
#         while true; do
#             read -p "Enter the height of the pyramid: " height

#             if [[ "$height" =~ ^[1-9][0-9]*$ ]]; then
#                 for ((i=1; i<=height; i++)); do
#                     spaces=$((height - i))
#                     numbers=$(seq 1 $i | tr '\n' ' ')
#                     echo "$(printf ' %*s' $spaces)$numbers"
#                 done
#                 break
#             else
#                 echo "Height should be a positive integer."
#             fi
#         done

#     elif [[ "$choice" == '2' ]]; then
#         while true; do
#             read -p "Enter the character you want to use: " character

#             if [[ "${#character}" == 1 ]]; then
#                 while true; do
#                     read -p "Enter the height of the pyramid: " height

#                     if [[ "$height" =~ ^[1-9][0-9]*$ ]]; then
#                         for ((i=1; i<=height; i++)); do
#                             spaces=$((height - i))
#                             characters=$(printf "%${i}s" "$character")
#                             echo "$(printf ' %*s' $spaces)$characters"
#                         done
#                         break
#                     else
#                         echo "Height should be a positive integer."
#                     fi
#                 done
#                 break
#             else
#                 echo "Please enter a single character."
#             fi
#         done

#     elif [[ "$choice" == '3' ]]; then
#         echo "Exiting the program."
#         break

#     else
#         echo "Invalid choice. Please select a valid option (1/2/3)."
#     fi
# done

#!/bin/bash

while true; do
    echo -e "\nPyramid Printing Menu:"
    echo "1. Print a Pyramid of Numbers"
    echo "2. Print a Pyramid of Characters"
    echo "3. Quit"

    read -p "Enter your choice (1/2/3): " choice

    if [[ "$choice" == '1' ]]; then
        while true; do
            read -p "Enter the height of the pyramid: " height

            if [[ "$height" =~ ^[1-9][0-9]*$ ]]; then
                for ((i=1; i<=height; i++)); do
                    spaces=$((height - i))
                    numbers=$(seq 1 $i | tr '\n' ' ')
                    echo "$(printf ' %*s' $spaces)$numbers"
                done
                break
            else
                echo "Height should be a positive integer."
            fi
        done

    elif [[ "$choice" == '2' ]]; then
        while true; do
            read -p "Enter the character you want to use: " character

            if [[ "${#character}" == 1 ]]; then
                while true; do
                    read -p "Enter the height of the pyramid: " height

                    if [[ "$height" =~ ^[1-9][0-9]*$ ]]; then
                        for ((i=1; i<=height; i++)); do
                            spaces=$((height - i))
                            characters=$(seq -s ' ' 1 $i | sed 's/ /'"$character"'/g')
                            echo "$(printf ' %*s' $spaces)$characters"
                        done
                        break
                    else
                        echo "Height should be a positive integer."
                    fi
                done
                break
            else
                echo "Please enter a single character."
            fi
        done

    elif [[ "$choice" == '3' ]]; then
        echo "Exiting the program."
        break

    else
        echo "Invalid choice. Please select a valid option (1/2/3)."
    fi
done
