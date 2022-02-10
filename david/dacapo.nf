#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process dacapo {
    executor 'lsf'
    clusterOptions "$params.clusterOptions"
    cpus 10
    conda '/groups/scicompsoft/home/ackermand/miniconda3/envs/dacapo'
    //publishDir 'output'
    //input:
    //  path x
    //output:
    //  path 'bar.txt'
    script:
      """
      dacapo train -r distance_task_20211130_six_class_distances_datasplit_20211130_dummy_architecture_20211130_gunpowder_trainer_20211130:2
      """
}

workflow {
  dacapo()
}
