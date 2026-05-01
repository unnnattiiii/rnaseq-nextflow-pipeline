#!/bin/bash
#SBATCH --job-name=hisat2_build
#SBATCH --partition=short
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=16GB
#SBATCH --time=01:00:00
#SBATCH --output=logs/build_%j.log

cd ~/rnaseq-nextflow-pipeline/genome

singularity exec ~/rnaseq-nextflow-pipeline/work/singularity/quay.io-biocontainers-mulled-v2-a97e90b3b802d1da3d6958e0867610c718cb5eb1-2880dd9d8ad0a7b221d4eacda9a818e92983128d-0.img \
    hisat2-build -p 8 yeast.fa yeast/genome

echo "Done!"
