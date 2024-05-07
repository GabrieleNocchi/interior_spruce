#!/bin/bash
#SBATCH --time=00-96:00:00
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=16G
#SBATCH --account=def-yeaman

module load r/4.3.1

Rscript gab_hmm.R
