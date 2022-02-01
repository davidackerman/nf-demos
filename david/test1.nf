#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process foo {
    executor 'lsf'
    clusterOptions "$params.clusterOptions"
    publishDir 'output'
    output:
      path 'foo.txt'
    script:
      """
      echo first_command > foo.txt
      """
}

process bar {
    executor 'lsf'
    clusterOptions "$params.clusterOptions"
    conda '/groups/scicompsoft/home/ackermand/Programming/multiresolution-mesh-creator/multiresolution_mesh_creator.yml'
    publishDir 'output'
    input:
      path x
    output:
      path 'bar.txt'
    script:
      """
      conda info > bar.txt
      head -n 1 $x >> bar.txt
      echo third_command >> bar.txt
      """
}

workflow {
  foo()
  data = channel.fromPath('data/test/baz.txt')
  bar(data)
}
