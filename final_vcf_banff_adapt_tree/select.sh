/data/programs/bcftools-1.9/bcftools view renamed_banff_adapt_tree_filtered_MAF.vcf.gz -s ^Sp_342A3,Sp_479A5,Sp_367A5,HI.0744.008.Index_11.Sp_576A3,HI.0834.004.BioOc_7.Sp_579A3,HI.0834.005.BioOc_8.Sp_577A3,HI.0893.001.BioOc_2.Sp_578A4,HI.0893.005.BioOc_6.Sp_576A4,HI.0941.003.BioO_2.Sp_577A4,HI.0943.006.BioO_3.Sp_578A3,HI.0963.005.BioO_12.Sp_579A4,HI.0943.004.BioO_6.Sp_3586A3,HI.1286.008.BioO_9.Pi_45A5,F307_CAL_105502_P002_WE07_i5-533_i7-44_S7900_L002,F307_CAL_105502_P002_WH11_i5-533_i7-95_S7940_L002,F307_CAL_105502_P004_WH06_i5-535_i7-49_S8110_L002 -Oz -o tmp666.vcf.gz




/data/programs/vcftools_0.1.13/bin/vcftools --gzvcf tmp666.vcf.gz --max-missing 0.7 --maf 0.05 --recode --recode-INFO-all --stdout > selected_renamed_banff_adapt_tree_filtered_MAF_stitched.vcf

rm tmp666.vcf.gz


bgzip selected_renamed_banff_adapt_tree_filtered_MAF_stitched.vcf
tabix -p vcf selected_renamed_banff_adapt_tree_filtered_MAF_stitched.vcf.gz
