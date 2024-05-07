/data/programs/bcftools-1.9/bcftools filter -e 'MQ < 30' *vcf.gz -Oz > tmp.vcf.gz

/data/programs/vcftools_0.1.13/bin/vcftools --gzvcf tmp.vcf.gz --max-missing 0.7 --minQ 30 --minGQ 20 --minDP 5 --max-alleles 2 --recode --recode-INFO-all --stdout > banff_adapt_tree_filtered.vcf
/data/programs/vcftools_0.1.13/bin/vcftools --gzvcf tmp.vcf.gz --max-missing 0.7 --minQ 30 --minGQ 20 --minDP 5 --max-alleles 2 --maf 0.05 --recode --recode-INFO-all --stdout > banff_adapt_tree_filtered_MAF.vcf

rm tmp.vcf.gz


bgzip banff_adapt_tree_filtered.vcf
tabix -p vcf banff_adapt_tree_filtered.vcf.gz


bgzip banff_adapt_tree_filtered_MAF.vcf
tabix -p vcf banff_adapt_tree_filtered_MAF.vcf.gz

