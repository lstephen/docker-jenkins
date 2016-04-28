

node('construi') {
  properties [[$class: 'BuildDiscarderProperty', strategy: [$class: 'LogRotator', daysToKeepStr: '30']]]

  stage 'Checkout'
  checkout scm

  stage 'Build'
  sh 'construi build'
}
