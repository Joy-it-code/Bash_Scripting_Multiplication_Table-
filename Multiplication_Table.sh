#!/usr/bin/bash

# Function to generate and display the multiplication table
generate_table() {
    local number=$1
    local start=$2
    local end=$3
    local order=$4

    echo ""
    echo "Multiplication Table for $number from $start to $end ($order order):"
    echo "---------------------------------------------"

    if [[ $order == "asc" ]]; then
        for i in $(seq $start $end); do
            echo "$number x $i = $((number * i))"
        done
    else
        for i in $(seq $end -1 $start); do
            echo "$number x $i = $((number * i))"
        done
    fi
    echo "---------------------------------------------"
}

# Main loop for user interaction
while true; do
    # Prompt the user for a number
    echo -n "Enter a number for the multiplication table: "
    read number

    # Validate that the input is a number
    if ! [[ $number =~ ^[0-9]+$ ]]; then
        echo "Invalid input. Please enter a positive integer."
        continue
    fi

    # Ask if the user wants a full or partial table
    echo -n "Do you want a full table (1-10) or a partial table? (full/partial): "
    read choice

    if [[ $choice == "full" ]]; then
        start=1
        end=10
    elif [[ $choice == "partial" ]]; then
        # Prompt for the start and end of the range
        echo -n "Enter the starting number of the range: "
        read start
        echo -n "Enter the ending number of the range: "
        read end

        # Validate the range
        if ! [[ $start =~ ^[0-9]+$ && $end =~ ^[0-9]+$ ]]; then
            echo "Invalid range inputs. Please enter positive integers."
            continue
        fi
        if (( start > end )); then
            echo "Invalid range. Start cannot be greater than end."
            continue
        fi
    else
        echo "Invalid choice. Please enter 'full' or 'partial'."
        continue
    fi

    # Ask if the user wants ascending or descending order
    echo -n "Do you want the table in ascending or descending order? (asc/desc): "
    read order
    if [[ $order != "asc" && $order != "desc" ]]; then
        echo "Invalid choice. Please enter 'asc' or 'desc'."
        continue
    fi

    # Generate and display the multiplication table
    generate_table $number $start $end $order

    # Ask if the user wants to repeat
    echo -n "Do you want to generate another multiplication table? (yes/no): "
    read repeat
    if [[ $repeat != "yes" ]]; then
        echo "Thank you for using the Multiplication Table Generator. Goodbye!"
        break
    fi
done
