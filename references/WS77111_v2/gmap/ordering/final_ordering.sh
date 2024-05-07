awk 'NR==FNR{map[$12]=$1; next} {if ($3 in map) print $0"\t"map[$3]}' formatted_map_only_1_cDNA_per_scaff.txt Pglauca_geneticMap_v2.GCATfilter.tsv > final_order.txt
