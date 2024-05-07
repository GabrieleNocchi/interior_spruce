#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=16G
#SBATCH --time=00-23:00:00
#SBATCH --account=def-yeaman

module load vcftools bcftools
module load StdEnv/2020 intel/2020.1.217 tabix/0.2.6


bcftools stats -s - spruce_filtered.vcf.gz > filtered_stats.txt
bcftools stats -s - spruce_filtered_MAF.vcf.gz > filtered_stats_MAF.txt

module load scipy-stack
module load python

plot-vcfstats -p ./stats_filtered filtered_stats.txt
plot-vcfstats -p ./stats_filtered_MAF filtered_stats_MAF.txt
