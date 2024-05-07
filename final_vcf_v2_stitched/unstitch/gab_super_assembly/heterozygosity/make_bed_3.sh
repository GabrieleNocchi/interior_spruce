/data/programs/bcftools-1.9/bcftools annotate --set-id +'%CHROM\_%POS\_%REF\_%FIRST_ALT' gab_superscaffold_heterozygosity_filtered.vcf --threads 4 -Ov -o temp.vcf
/data/programs/vcftools_0.1.13/bin/vcftools --vcf temp.vcf --max-missing 1 --recode --recode-INFO-all --stdout > ID.vcf
plink2 --vcf ID.vcf --allow-extra-chr --threads 4 --make-bed --out gab_superscaffold_heterozygosity_filtered_ID_no_missing
rm ID.vcf
rm temp.vcf
