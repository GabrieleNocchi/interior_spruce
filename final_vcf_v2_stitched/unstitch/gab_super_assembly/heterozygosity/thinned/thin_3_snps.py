#!/usr/bin/env python

import sys

# Dictionary to store the count of SNPs per scaffold
scaffold_snps_count = {}

with open("inter_freq_superscaffold_heterozygosity_filtered.vcf", "r") as f:
    for line in f:
        if line.startswith("#"):
            # Print header lines without modification
            print(line.strip())
            continue

        fields = line.strip().split("\t")
        scaffold = fields[0]

        if scaffold not in scaffold_snps_count:
            # If scaffold is encountered for the first time, initialize count to 0
            scaffold_snps_count[scaffold] = 0

        if scaffold_snps_count[scaffold] < 3:
            # Print the SNP if the count for the scaffold is less than 3
            print(line.strip())
            scaffold_snps_count[scaffold] += 1

# Remove temporary files if needed

