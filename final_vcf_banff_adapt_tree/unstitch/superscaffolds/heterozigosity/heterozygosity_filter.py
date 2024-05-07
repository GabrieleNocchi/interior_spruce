import vcf

# Load VCF file
vcf_reader = vcf.Reader(open('gab_superscaffold.vcf', 'r'))

# Open output file for writing filtered SNPs
output_file = open('filtered_snps.vcf', 'w')
vcf_writer = vcf.Writer(output_file, vcf_reader)

# Filter SNPs based on heterozygosity
for record in vcf_reader:
    # Calculate heterozygosity
    total_calls = record.num_hom_ref + record.num_het + record.num_hom_alt
    if total_calls > 0:
        heterozygosity = record.num_het / total_calls
    else:
        heterozygosity = 0
    
    # Write SNP to output if heterozygosity is below 0.8
    if heterozygosity <= 0.8:
        vcf_writer.write_record(record)

# Close output file
output_file.close()

