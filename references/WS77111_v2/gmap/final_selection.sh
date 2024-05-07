awk '
    BEGIN {
        FS = OFS = "\t"
    }

    # Check if $10 is above 90 and $11 is above 90
    $10 > 90 && $11 > 90 {
        # Store the highest $11 value for each $12
        if ($11 > max[$12]) {
            max[$12] = $11
            line[$12] = $0
            count[$12] = 1
        } else if ($11 == max[$12]) {
            # Increment count for the same max $11 value
            count[$12]++
        }
    }

    # At the end, print out the lines stored for each $12 if count[$12] is 1
    END {
        for (key in line) {
            if (count[key] == 1) {
                print line[key]
            }
        }
    }
' gmap_stats.txt > final_selection.txt

