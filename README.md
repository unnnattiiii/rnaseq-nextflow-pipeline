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
- Docker

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

Pipeline was tested locally using human RNA-seq data (SRR6357070) mapped against 
the Drosophila melanogaster dm6 genome as a lightweight test reference.
Full analysis intended to be run on HPC with appropriate human genome index (GRCh38).

## Author

Unnati Moradiya
