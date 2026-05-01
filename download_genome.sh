#!/bin/bash
#SBATCH --job-name=download_genome
#SBATCH --partition=short
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=8GB
#SBATCH --time=02:00:00
#SBATCH --output=logs/download_%j.log

mkdir -p logs genome/grch38

cd genome

# Download GRCh38 HISAT2 index
wget -q https://genome-idx.s3.amazonaws.com/hisat/grch38_genome.tar.gz -O grch38.tar.gz
tar -xzf grch38.tar.gz -C grch38/ --strip-components=1
rm grch38.tar.gz

# Download GTF annotation
wget -q https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_44/gencode.v44.annotation.gtf.gz -O grch38.gtf.gz
gunzip grch38.gtf.gz

echo "Done!"
