# RNA-seq Analysis Pipeline

A modular, containerized RNA-seq pipeline built with Nextflow DSL2 that processes 
raw sequencing reads into gene counts. Built to be portable — runs locally with 
Docker and on HPC clusters with Singularity and SLURM without changing any pipeline code.

## Pipeline Overview
Raw FASTQ → FastQC → fastp → FastQC → HISAT2 → featureCounts → MultiQC

## What Each Step Does

1. **FastQC** — checks raw read quality before any processing
2. **fastp** — trims adapter sequences and filters low quality reads
3. **FastQC** — checks quality again after trimming to confirm fastp worked
4. **HISAT2** — aligns trimmed reads to a reference genome (splice-aware)
5. **featureCounts** — counts how many reads map to each gene
6. **MultiQC** — aggregates all QC reports into a single HTML summary

## Why Nextflow

Nextflow handles job scheduling, parallelization, and caching automatically. 
Each process runs inside its own container so there's nothing to install manually. 
The same pipeline runs identically on a laptop or an HPC cluster — only the 
config file changes.

## Requirements

- Nextflow >= 21.10
- Docker (local) or Singularity (HPC)
- SLURM (for HPC execution)

## Project Structure
rnaseq-nextflow-pipeline/
├── main.nf
├── nextflow.config
├── samplesheet.csv
└── modules/
├── fastqc.nf
├── fastp.nf
├── hisat2.nf
├── featurecounts.nf
└── multiqc.nf

## Usage

**1. Clone the repository:**
```bash
git clone https://github.com/unnnattiiii/rnaseq-nextflow-pipeline.git
cd rnaseq-nextflow-pipeline
```

**2. Create your samplesheet.csv:**

**3. Run locally with Docker:**
```bash
nextflow run main.nf \
    --input samplesheet.csv \
    --genome_index /path/to/genome/index \
    --gtf /path/to/annotation.gtf \
    --outdir results
```

**4. Run on HPC with SLURM:**
```bash
sbatch run_pipeline.sh
```

## Output

| Directory | Contents |
|-----------|----------|
| fastqc_raw/ | FastQC reports for raw reads |
| fastp/ | Trimmed reads and fastp HTML/JSON reports |
| fastqc_trimmed/ | FastQC reports after trimming |
| hisat2/ | Sorted BAM files and indexes |
| featurecounts/ | Per-sample gene count matrices |
| multiqc/ | Aggregated QC report (single HTML file) |

## Test Data

Developed and tested in two environments:

**Local (Mac, Docker):** Paired-end S. cerevisiae RNA-seq data from nf-core 
test datasets (GSE110004), aligned to the S. cerevisiae R64-1-1 reference genome.

**HPC (Northeastern Explorer cluster, Singularity + SLURM):** Same dataset 
run on the cluster. Nextflow submitted 21 SLURM jobs distributed across 
multiple compute nodes, completing in under 4 minutes.

For real analysis, swap in your own FASTQ files, genome index, and GTF 
annotation — the pipeline code stays the same.

## Author

Unnati Moradiya — MS Bioinformatics, Northeastern University  
[LinkedIn](https://www.linkedin.com/in/unnatimoradiya) | [GitHub](https://github.com/unnnattiiii)
