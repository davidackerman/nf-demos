#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process dacapo {
    clusterOptions "$params.clusterOptions"
    cpus 5
    conda '/groups/scicompsoft/home/ackermand/miniconda3/envs/dacapo'
    script:
      """
      dacapo train -r ${params.run_name}
      """
}

workflow {
  dacapo()
}
