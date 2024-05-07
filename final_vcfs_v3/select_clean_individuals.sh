/data/programs/bcftools-1.9/bcftools view spruce_filtered_MAF.vcf.gz -s ^F307_CAL_105502_P002_WE07_i5-533_i7-44_S7900_L002,F307_CAL_105502_P002_WH11_i5-533_i7-95_S7940_L002,F307_CAL_105502_P004_WH06_i5-535_i7-49_S8110_L002 -Oz -o ./selection/tmp.vcf.gz




/data/programs/vcftools_0.1.13/bin/vcftools --gzvcf ./selection/tmp.vcf.gz --max-missing 0.7 --maf 0.05 --recode --recode-INFO-all --stdout > ./selection/380_spruce_filtered_MAF.vcf

rm ./selection/tmp.vcf.gz


bgzip ./selection/380_spruce_filtered_MAF.vcf
tabix -p vcf ./selection/380_spruce_filtered_MAF.vcf.gz
