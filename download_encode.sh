#!/bin/bash
#SBATCH --job-name=download_encode
#SBATCH --partition=short
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16GB
#SBATCH --time=04:00:00
#SBATCH --output=logs/encode_%j.log

cd ~/rnaseq-nextflow-pipeline/data
rm -f *.fastq.gz

# ENCODE human brain RNA-seq - clean single-end data
wget -q https://www.encodeproject.org/files/ENCFF001RTP/@@download/ENCFF001RTP.fastq.gz -O CTRL_1.fastq.gz
wget -q https://www.encodeproject.org/files/ENCFF001RTQ/@@download/ENCFF001RTQ.fastq.gz -O CTRL_2.fastq.gz
wget -q https://www.encodeproject.org/files/ENCFF001RTS/@@download/ENCFF001RTS.fastq.gz -O PD_1.fastq.gz
wget -q https://www.encodeproject.org/files/ENCFF001RTT/@@download/ENCFF001RTT.fastq.gz -O PD_2.fastq.gz

echo "Done!"

