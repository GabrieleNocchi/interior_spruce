#!/usr/bin/env python

import sys

previous_scaffold = None

with open("inter_freq_superscaffold_heterozygosity_filtered.vcf", "r") as f:
    for line in f:
        if line.startswith("#"):
            # Print header lines without modification
            print(line.strip())
            continue

        fields = line.strip().split("\t")
        scaffold = fields[0]

        if scaffold != previous_scaffold:
            # Print the first SNP encountered for each scaffold
            print(line.strip())
            previous_scaffold = scaffold

# Remove temporary files if needed

