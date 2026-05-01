#!/bin/bash
#SBATCH --job-name=download_v3
#SBATCH --partition=short
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16GB
#SBATCH --time=06:00:00
#SBATCH --output=logs/data3_%j.log

module load sratoolkit

mkdir -p ~/rnaseq-nextflow-pipeline/data
cd ~/rnaseq-nextflow-pipeline/data

for ACC in SRR2015656 SRR2015657 SRR2015658 SRR2015659; do
    echo "Prefetching ${ACC}..."
    prefetch ${ACC}
    echo "Dumping ${ACC}..."
    fastq-dump --split-files --gzip --skip-technical ${ACC}
    echo "Done ${ACC}"
done

echo "All done!"
