awk '
    {
        count[$12]++
        lines[$12] = lines[$12] $0 ORS
    }

    END {
        for (value in count) {
            if (count[value] > 1) {
 
                printf "%s", lines[value]
            }
        }
    }
' gmap_stats.txt > multiple_mapped_cDNA.txt

