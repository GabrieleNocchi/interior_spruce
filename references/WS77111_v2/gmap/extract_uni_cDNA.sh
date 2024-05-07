awk '{count[$12]++; line[$12] = $0} END {for (key in count) {if (count[key] == 1) {print line[key]}}}' gmap_stats.txt > uniquely_mapped_cDNA.txt
