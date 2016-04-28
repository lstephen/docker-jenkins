properties([[$class: 'BuildDiscarderProperty', strategy: [$class: 'LogRotator', daysToKeepStr: '30']]])

node('construi') {
  wrap([$class: 'AnsiColorBuildWrapper', colorMapName: 'xterm'])

  stage 'Checkout'
  checkout scm

  stage 'Build'
  sh 'construi build'
}
