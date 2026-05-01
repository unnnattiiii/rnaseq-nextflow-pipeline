process FASTP {
    tag "$sample_id"
    publishDir "${params.outdir}/fastp", mode: 'copy'
    container 'quay.io/biocontainers/fastp:0.23.2--h5f740d0_3'

    input:
    tuple val(sample_id), path(reads)

    output:
    tuple val(sample_id), path("${sample_id}_1.trimmed.fastq.gz"), path("${sample_id}_2.trimmed.fastq.gz"), emit: reads
    path "${sample_id}_fastp.json", emit: json
    path "${sample_id}_fastp.html"

    script:
    """
    fastp \
        -i ${reads[0]} \
        -I ${reads[1]} \
        -o ${sample_id}_1.trimmed.fastq.gz \
        -O ${sample_id}_2.trimmed.fastq.gz \
        -j ${sample_id}_fastp.json \
        -h ${sample_id}_fastp.html \
        --thread 2
    """
}
