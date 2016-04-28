properties(
  [ [$class: 'BuildDiscarderProperty', strategy: [$class: 'LogRotator', daysToKeepStr: '30'] ]
  , [$class: 'GithubProjectProperty', projectUrlStr: 'http://github.com/lstephen/docker-jenkins']
  ])

node('construi') {

  stage 'Checkout'
  checkout scm

  stage 'Build'
  wrap([$class: 'AnsiColorBuildWrapper', colorMapName: 'xterm']) {
    sh 'construi build'
  }

  step [$class: 'GitHubCommitNotifier, resultOnFailure: 'FAILURE']
}
