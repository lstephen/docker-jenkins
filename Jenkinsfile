
properties([[$class: 'BuildDiscarderProperty', strategy: [$class: 'LogRotator', daysToKeepStr: '30']]])
wrap([[$class: 'AnsiColorBuildWrapper', colorMapName: 'xterm']])

node('construi') {

  stage 'Checkout'
  checkout scm

  stage 'Build'
  sh 'construi build'
}
