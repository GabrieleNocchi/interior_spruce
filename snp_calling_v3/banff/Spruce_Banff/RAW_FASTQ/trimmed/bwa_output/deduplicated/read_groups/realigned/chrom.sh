#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --time=00-23:00:00
#SBATCH --account=def-yeaman



grep ">" /home/gabnoc/scratch/gatk_index/*fa > tmp
sed 's/^.//g' tmp > chromosomes.txt
