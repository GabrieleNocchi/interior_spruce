/data/programs/vcftools_0.1.13/bin/vcftools --gzvcf gab_superscaffold.vcf.gz --max-missing 0.7 --minQ 30 --minGQ 20 --minDP 5 --max-alleles 2 --maf 0.1 --recode --recode-INFO-all --stdout >inter_freq_superscaffold.vcf
