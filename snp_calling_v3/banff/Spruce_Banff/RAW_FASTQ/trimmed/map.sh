#!/bin/bash
#SBATCH --time=0-60:00
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=64G
#SBATCH --account=def-yeaman
#SBATCH --array=1-383

INPUT1=$(sed -n "${SLURM_ARRAY_TASK_ID}p" list1.txt)
INPUT2=$(sed -n "${SLURM_ARRAY_TASK_ID}p" list2.txt)
OUTPUT=$(sed -n "${SLURM_ARRAY_TASK_ID}p" list3.txt)

module load bwa samtools


bwa mem WS77111-v3.1000plus_LGs.fa $INPUT1 $INPUT2  > ./bwa_output/$OUTPUT\.sam
samtools view -Sb -q 10 ./bwa_output/$OUTPUT\.sam > ./bwa_output/$OUTPUT\.bam
rm ./bwa_output/$OUTPUT\.sam
samtools sort ./bwa_output/$OUTPUT\.bam > ./bwa_output/$OUTPUT\_sorted.bam
rm ./bwa_output/$OUTPUT\.bam
samtools index ./bwa_output/$OUTPUT\_sorted.bam

