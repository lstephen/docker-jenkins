properties properties: [[$class: 'BuildDiscarderProperty', strategy: [$class: 'LogRotator', daysToKeepStr: '30']]


node('construi') {
  stage 'Checkout'
  checkout scm

  stage 'Build'
  sh 'construi build'
}
