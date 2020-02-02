/*Comment section: */

process prokka {
  label 'prokka'
  publishDir "${params.output}/prokka", mode: 'copy', pattern: "${name}.faa" 

  input: 
    tuple val(name), file(fasta)

  output:
    tuple val(name), file("${name}.faa")

  script:
    """
      prokka --cpus ${task.cpus} --outdir output --prefix annotation ${fasta}
      mv output/annotation.faa ${name}.faa
    """
}

