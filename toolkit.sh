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


if [ "$choice" = "3" ]; then
        read -p "Enter input file: " in
        read -p "Enter output file: " out

        sed 's/[^a-zA-Z0-9 ]//g' "$in" > "$out"

        echo "Special characters removed!"
        echo "Special chars cleaned in $in" >> logs.txt
    fi


    if [ "$choice" = "4" ]; then
        read -p "Enter input file: " in
        read -p "Enter output file: " out

        grep -vwF -f stopwords.txt "$in" > "$out"

        echo "Stopwords removed!"
        echo "Stopwords cleaned in $in" >> logs.txt
    fi

if [ "$choice" = "5" ]; then
        read -p "Enter CSV file: " in
        read -p "Column number: " col
        read -p "Enter output file: " out

        awk -F, -v c="$col" '{
            gsub(/^[ \t]+|[ \t]+$/, "", $c)
            $c = tolower($c)
            print
        }' OFS=, "$in" > "$out"

        echo "CSV column cleaned!"
        echo "CSV column $col cleaned in $in" >> logs.txt
    fi

    if [ "$choice" = "6" ]; then
        read -p "Enter file: " in
        echo "Total lines: $(wc -l < "$in")"
        echo "Unique lines: $(sort "$in" | uniq | wc -l)"
        echo "Total words: $(wc -w < "$in")"
        echo "Total characters: $(wc -m < "$in")"
        echo "Longest line length: $(wc -L < "$in")"

        echo "Viewed statistics for $in" >> logs.txt
    fi
    if [ "$choice" = "7" ]; then
        read -p "Enter input file: " in
        read -p "Enter output file: " out

        grep -o '[0-9]\+' "$in" > "$out"

        echo "Numbers extracted!"
        echo "Extracted numbers from $in" >> logs.txt
    fi

    if [ "$choice" = "8" ]; then
        read -p "Enter input file: " in
        read -p "Enter output file: " out

        grep -Eo '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+' "$in" > "$out"

        echo "Emails extracted!"
        echo "Emails extracted from $in" >> logs.txt
    fi
    if [ "$choice" = "9" ]; then
        read -p "Enter input file: " in

        tr ' ' '\n' < "$in" | sort | uniq -c | sort -nr

        echo "Word frequency displayed!"
        echo "Word frequency checked for $in" >> logs.txt
    fi

    if [ "$choice" = "10" ]; then
        read -p "Enter input file: " in
        read -p "Word to replace: " w1
        read -p "Replace with: " w2
        read -p "Output file: " out

        sed "s/$w1/$w2/g" "$in" > "$out"

        echo "Word replaced!"
        echo "Replaced '$w1' with '$w2' in $in" >> logs.txt
    fi
    if [ "$choice" = "11" ]; then
        read -p "Enter first file: " f1
        read -p "Enter second file: " f2
        read -p "Enter output file: " out

        cat "$f1" "$f2" > "$out"

        echo "Files merged!"
        echo "Merged $f1 and $f2" >> logs.txt
    fi

    if [ "$choice" = "12" ]; then
        read -p "Enter file: " in
        read -p "Enter N: " n

        head -n "$n" "$in"

        echo "Displayed first $n lines of $in" >> logs.txt
    fi
    done