process FASTQC_RAW {
    tag "$sample_id"
    publishDir "${params.outdir}/fastqc_raw", mode: 'copy'
    container 'quay.io/biocontainers/fastqc:0.11.9--0'

    input:
    tuple val(sample_id), path(reads)

    output:
    path "*.html"
    path "*.zip", emit: zip

    script:
    """
    fastqc ${reads} --threads 2
    """
}

process FASTQC_TRIMMED {
    tag "$sample_id"
    publishDir "${params.outdir}/fastqc_trimmed", mode: 'copy'
    container 'quay.io/biocontainers/fastqc:0.11.9--0'

    input:
    tuple val(sample_id), path(read1), path(read2)

    output:
    path "*.html"
    path "*.zip", emit: zip

    script:
    """
    fastqc ${read1} ${read2} --threads 2
    """
}
