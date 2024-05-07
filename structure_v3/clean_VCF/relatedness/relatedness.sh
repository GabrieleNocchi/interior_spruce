
# Need to set SNPs IDs
/data/programs/bcftools-1.9/bcftools annotate --set-id +'%CHROM\_%POS\_%REF\_%FIRST_ALT' 380_spruce_filtered_MAF.vcf.gz --threads 4 -Ov -o ID.vcf

# LD pruning as highly linked SNPs can bias the structure analysis
/data/programs/plink --vcf ID.vcf --allow-extra-chr --indep-pairphase 50 5 0.4 --double-id --out ./pruned

# make a VCF only with unlinked SNPs (LD r2 max 0.4)
/data/programs/plink --vcf ID.vcf --allow-extra-chr --extract pruned.prune.in --recode vcf --out pruned --double-id

/data/programs/bcftools-1.9/bcftools reheader -s names.txt -o pruned_renamed.vcf pruned.vcf

mv pruned_renamed.vcf pruned.vcf

/data/programs/plink --genome --vcf pruned.vcf --allow-extra-chr --double-id




/data/programs/bcftools-1.9/bcftools query pruned.vcf -f '%CHROM\t%POS[\t%GT]\n' > matrix.txt


Rscript relatedness_synbreed.R
