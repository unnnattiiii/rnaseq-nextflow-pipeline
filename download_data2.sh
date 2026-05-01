#!/bin/bash
#SBATCH --job-name=download_se
#SBATCH --partition=short
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16GB
#SBATCH --time=04:00:00
#SBATCH --output=logs/data2_%j.log

mkdir -p data
cd data

module load sratoolkit

# Download as single-end (no --split-files)
fastq-dump --gzip SRR2015656
fastq-dump --gzip SRR2015657
fastq-dump --gzip SRR2015658
fastq-dump --gzip SRR2015659

echo "Done!"
