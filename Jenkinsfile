properties([[$class: 'BuildDiscarderProperty', strategy: [$class: 'LogRotator', daysToKeepStr: '30']]])

node('construi') {

  stage 'Checkout'
  checkout scm

  stage 'Build'
  wrap([$class: 'AnsiColorBuildWrapper', colorMapName: 'xterm']) {
    sh 'construi build'
  }
}
