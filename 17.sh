#!/bin/bash

# Create 'animals.txt' with some sample content
echo -e "Cat\ndog\nbear\nhello\nelephant\nhello\ntiger\nhello\nhorse\n" > animals.txt

if [[ -e animals.txt ]]; then
    # Display the contents of 'animals.txt'
    echo "Contents of animals.txt:"
    cat animals.txt

    # Create 'modified_animals.txt' by filtering lines without 'hello'
    grep -v "hello" animals.txt > modified_animals.txt

    if [[ -e modified_animals.txt ]]; then
        # Display the contents of 'modified_animals.txt'
        echo -e "\nModified File Contents:"
        cat modified_animals.txt
    else
        echo "Error: 'modified_animals.txt' was not created."
    fi

    # Clean up temporary files
    rm animals.txt

else
    echo "Error: 'animals.txt' was not found."
fi
