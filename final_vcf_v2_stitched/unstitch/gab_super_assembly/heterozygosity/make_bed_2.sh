/data/programs/bcftools-1.9/bcftools annotate --set-id +'%CHROM\_%POS\_%REF\_%FIRST_ALT' gab_superscaffold_heterozygosity_filtered.vcf --threads 4 -Ov -o temp.vcf
plink2 --vcf temp.vcf --allow-extra-chr --threads 4 --make-bed --out gab_superscaffold_heterozygosity_filtered_ID
rm temp.vcf
