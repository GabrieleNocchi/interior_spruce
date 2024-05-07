awk '{gsub(/@/, "", $12); sub(/\..*/, "", $12); print $0}' final_selection_2.txt > formatted.txt
awk 'NR==FNR{arr[$3]; next} $12 in arr' Pglauca_geneticMap_v2.GCATfilter.tsv formatted.txt > formatted_map_only.txt
