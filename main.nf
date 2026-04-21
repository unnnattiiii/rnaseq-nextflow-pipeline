#!/usr/bin/env nextflow

nextflow.enable.dsl=2

include { FASTQC_RAW; FASTQC_TRIMMED } from './modules/fastqc'
include { FASTP }                       from './modules/fastp'
include { HISAT2 }                      from './modules/hisat2'
include { FEATURECOUNTS }               from './modules/featurecounts'
include { MULTIQC }                     from './modules/multiqc'

params.input        = "$projectDir/samplesheet.csv"
params.outdir       = "$projectDir/results"
params.genome_index = "$projectDir/genome/dm6/genome"
params.gtf          = "$projectDir/genome/dm6.gtf"

workflow {
    reads_ch = Channel
        .fromPath(params.input)
        .splitCsv(header: true)
        .map { row -> tuple(row.sample, [file(row.fastq_1), file(row.fastq_2)]) }

    FASTQC_RAW(reads_ch)
    trimmed = FASTP(reads_ch)
    FASTQC_TRIMMED(trimmed.reads)
    aligned = HISAT2(trimmed.reads, Channel.fromPath("$projectDir/genome/dm6").first())
    FEATURECOUNTS(aligned, Channel.fromPath(params.gtf).first())
    MULTIQC(
        FASTQC_RAW.out.zip.collect()
        .mix(FASTQC_TRIMMED.out.zip.collect())
        .mix(trimmed.json.collect())
        .collect()
    )
}
