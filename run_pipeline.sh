#!/bin/bash
#SBATCH --job-name=rnaseq_pipeline
#SBATCH --partition=short
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=8GB
#SBATCH --time=24:00:00
#SBATCH --output=logs/pipeline_%j.log

cd ~/rnaseq-nextflow-pipeline

nextflow run main.nf -resume
