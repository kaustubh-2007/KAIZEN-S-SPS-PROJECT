#!/bin/bash

echo " DATA CLEANING TOOLKIT " >> logs.txt
echo "" >> logs.txt

while true
do
    echo ""
        echo "           DATA CLEANING TOOLKIT"
    
    echo "1. Basic Cleaning (spaces + lowercase + empty lines)"
    echo "2. Remove Duplicates & Sort"
    echo "3. Remove Special Characters"
    echo "4. Remove Stopwords"
    echo "5. Clean CSV Column"
    echo "6. Statistics"
    echo "7. Extract Numbers Only"
    echo "8. Extract Emails Only"
    echo "9. Count Frequency of Each Word"
    echo "10. Replace a Word With Another"
    echo "11. Merge Two Files"
    echo "12. Show First N Lines"
    echo "13. Show Last N Lines"
    echo "14. Exit"
    
    read -p "Enter your choice: " choice
if [ "$choice" = "1" ]; then
        read -p "Enter input file: " in
        read -p "Enter output file: " out

        sed 's/^[ \t]//; s/[ \t]$//' "$in" | tr 'A-Z' 'a-z' | grep -v '^$' > "$out"

        echo "Basic cleaning done!"
        echo "Basic cleaning on $in" >> logs.txt
    fi


  
    if [ "$choice" = "2" ]; then
        read -p "Enter input file: " in
        read -p "Enter output file: " out

        sort "$in" | uniq > "$out"

        echo "Duplicates removed & sorted!"
        echo "Removed duplicates in $in" >> logs.txt
    fi
done
