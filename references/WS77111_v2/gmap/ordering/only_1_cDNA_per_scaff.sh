#awk '!seen[$1]++' formatted_map_only.txt > formatted_map_only_1_scaf.txt


awk '{
    key = $1;  # Store the value of $1 as the key
    if ($10 >= 90) {  # Check if $10 is above or equal to 90
        if ($11 > max11[key] || ($11 == max11[key] && $10 > max10[key])) {  # Check conditions for updating max values
            max11[key] = $11;  # Update max $11
            max10[key] = $10;  # Update max $10
            line[key] = $0;    # Store the entire line
        }
    } else {  # If $10 is below 90
        if ($11 > max11[key] || ($11 == max11[key] && $10 > max10[key]) || !kept[key]) {  # Check conditions for updating max values
            max11[key] = $11;  # Update max $11
            max10[key] = $10;  # Update max $10
            line[key] = $0;    # Store the entire line
            kept[key] = 1;      # Mark that a line is kept for this key
        }
    }
}
END {
    for (key in line) {  # Iterate through stored lines
        print line[key];  # Print the stored line for each unique value of $1
    }
}' formatted_map_only.txt > formatted_map_only_1_cDNA_per_scaff.txt
