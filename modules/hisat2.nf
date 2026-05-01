process HISAT2 {
    tag "$sample_id"
    publishDir "${params.outdir}/hisat2", mode: 'copy'
    container 'quay.io/biocontainers/mulled-v2-a97e90b3b802d1da3d6958e0867610c718cb5eb1:2880dd9d8ad0a7b221d4eacda9a818e92983128d-0'

    input:
    tuple val(sample_id), path(read1), path(read2)
    path index_dir

    output:
    tuple val(sample_id), path("${sample_id}.bam"), path("${sample_id}.bam.bai")

    script:
    """
    export TMPDIR=\$(pwd)
    hisat2 -x ${index_dir}/genome \
           -1 ${read1} \
           -2 ${read2} \
           --threads 4 \
           --dta \
           -S ${sample_id}.sam

    samtools sort -o ${sample_id}.bam ${sample_id}.sam
    samtools index ${sample_id}.bam
    """
}
