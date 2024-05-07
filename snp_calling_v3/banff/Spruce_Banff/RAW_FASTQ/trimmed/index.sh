#!/bin/bash
#SBATCH --time=0-48:00
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=64G
#SBATCH --account=def-yeaman


module load bwa 


bwa index -a bwtsw WS77111-v3.1000plus_LGs.fa
