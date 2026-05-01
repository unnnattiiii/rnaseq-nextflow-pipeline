#!/bin/bash
#SBATCH --job-name=download_data
#SBATCH --partition=short
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16GB
#SBATCH --time=04:00:00
#SBATCH --output=logs/data_%j.log

mkdir -p data

cd data

# Load SRA toolkit
module load sratoolkit

# Download 2 PD samples and 2 control samples
fastq-dump --split-files --gzip SRR2015656
fastq-dump --split-files --gzip SRR2015657
fastq-dump --split-files --gzip SRR2015658
fastq-dump --split-files --gzip SRR2015659

echo "Done!"
