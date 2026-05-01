# RNA-seq Analysis Pipeline

A modular, containerized RNA-seq pipeline built with Nextflow DSL2. Performs end-to-end processing from raw reads to gene counts.

## Pipeline Overview

## Steps

1. **FastQC** - Quality control on raw reads
2. **fastp** - Adapter trimming and quality filtering
3. **FastQC** - Quality control on trimmed reads
4. **HISAT2** - Splice-aware alignment to reference genome
5. **featureCounts** - Read quantification per gene
6. **MultiQC** - Aggregated QC report

## Requirements

- Nextflow >= 21.10
- Docker (local) or Singularity (HPC)
- SLURM (for HPC execution)

All tools run inside Docker containers — no manual installation needed.

## Usage

1. Clone the repository:
2. Create a samplesheet.csv:
3. Run the pipeline:
## Output

| Directory | Contents |
|-----------|----------|
| fastqc_raw/ | FastQC reports for raw reads |
| fastp/ | Trimmed reads and fastp reports |
| fastqc_trimmed/ | FastQC reports for trimmed reads |
| hisat2/ | BAM files and indexes |
| featurecounts/ | Gene count matrices |
| multiqc/ | Aggregated QC report |

## Test Data

Pipeline was developed and tested in two environments:

**Local (Mac, Docker):** Paired-end RNA-seq test data from nf-core 
test datasets, aligned to Drosophila melanogaster dm6 genome.

**HPC (Northeastern Explorer cluster, Singularity + SLURM):** 
Paired-end S. cerevisiae RNA-seq data (nf-core test datasets, GSE110004), 
aligned to S. cerevisiae R64-1-1 genome. Pipeline submitted 21 SLURM 
jobs across multiple compute nodes, completing in under 4 minutes.

## Author

Unnati Moradiya
