paste full_names.txt spruce_filtered_MAF_fast_output.2.meanQ | awk '{print $1 "\t" ($2 >= 0.95 ? "parent1" : ($3 >= 0.95 ? "parent2" : "admixed"))}' > clines_new.txt
