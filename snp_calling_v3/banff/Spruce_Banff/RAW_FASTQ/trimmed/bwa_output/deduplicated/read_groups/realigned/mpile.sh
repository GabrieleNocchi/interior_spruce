#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=32G
#SBATCH --time=00-23:00:00
#SBATCH --account=def-yeaman
#SBATCH --array=1-999


module load bcftools/1.11

CHROMFILE=$(sed -n "${SLURM_ARRAY_TASK_ID}p" chrom_files_list.txt)

bcftools mpileup -Ou -f /home/gabnoc/scratch/gatk_index/*.fa --bam-list list.txt -q 5 -R $CHROMFILE -I -a FMT/AD | bcftools call -S ploidymap.txt -G - -f GQ -mv -Ov > $CHROMFILE\.vcf


