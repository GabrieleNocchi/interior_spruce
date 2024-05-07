/data/programs/bcftools-1.9/bcftools annotate --set-id +'%CHROM\_%POS' gab_superscaffold.vcf.gz --threads 4 -Ov -o test_id.vcf

/data/programs/plink-1.9 --vcf test_id.vcf --allow-extra-chr --recodeA --double-id --out test


Rscript create_file.R



rm test_id.vcf
rm test.raw
rm test.nosex
rm test.log
rm test.lfmm
