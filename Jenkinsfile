
properties([[$class: 'BuildDiscarderProperty', strategy: [$class: 'LogRotator', daysToKeepStr: '30']]])
properties([[$class: 'DiskUsageProperty']])

node('construi') {

  stage 'Checkout'
  checkout scm

  stage 'Build'
  sh 'construi build'
}
