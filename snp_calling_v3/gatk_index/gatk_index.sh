#!/bin/bash
#SBATCH --time=0-48:00
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=64G
#SBATCH --account=def-yeaman


module load StdEnv/2020 samtools/1.12

samtools faidx WS77111-v3.1000plus_LGs.fa


module purge
module load picard java


java -jar $EBROOTPICARD/picard.jar CreateSequenceDictionary R=WS77111-v3.1000plus_LGs.fa O=WS77111-v3.1000plus_LGs.dict
