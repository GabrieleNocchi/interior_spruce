#!/bin/bash
#SBATCH --time=4-10:00
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=32G
#SBATCH --account=def-yeaman
#SBATCH --array=1-383

INPUT=$(sed -n "${SLURM_ARRAY_TASK_ID}p" list1.txt)
OUTPUT=$(sed -n "${SLURM_ARRAY_TASK_ID}p" list2.txt)

module load StdEnv/2020 samtools/1.12

samtools index $INPUT


module purge
module load nixpkgs/16.09
module load java gatk/3.8


# Realign
java -jar $EBROOTGATK/GenomeAnalysisTK.jar -T RealignerTargetCreator -R /home/gabnoc/scratch/gatk_index/WS77111-v3.1000plus_LGs.fa -I $INPUT -o $OUTPUT\.intervals

java -jar $EBROOTGATK/GenomeAnalysisTK.jar -T IndelRealigner -R /home/gabnoc/scratch/gatk_index/WS77111-v3.1000plus_LGs.fa -I $INPUT -targetIntervals $OUTPUT\.intervals --consensusDeterminationModel USE_READS  -o $OUTPUT\_realigned.bam
