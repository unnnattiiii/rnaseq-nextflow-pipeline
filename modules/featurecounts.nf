process FEATURECOUNTS {
    tag "$sample_id"
    publishDir "${params.outdir}/featurecounts", mode: 'copy'
    container 'quay.io/biocontainers/subread:2.0.1--hed695b0_0'

    input:
    tuple val(sample_id), path(bam), path(bai)
    path gtf

    output:
    path "${sample_id}_counts.txt"
    path "${sample_id}_counts.txt.summary"

    script:
    """
    featureCounts \
        -T 2 \
        -p \
        -a ${gtf} \
        -o ${sample_id}_counts.txt \
        ${bam}
    """
}
