properties(
  [ [$class: 'BuildDiscarderProperty', strategy: [$class: 'LogRotator', daysToKeepStr: '30'] ]
  , [$class: 'GithubProjectProperty', projectUrlStr: 'http://github.com/lstephen/docker-jenkins']
  ])

def construi(target) {
  wrap([$class: 'AnsiColorBuildWrapper', colorMapName: 'xterm']) {
    sh "construi ${target}"
  }
}

node('construi') {
  stage 'Checkout'
  checkout scm

  echo "${scm}"

  sh 'git branch'

  if (env.BRANCH_NAME == 'master') {
    stage 'Release'


    withCredentials(
      [
        [ $class: 'UsernamePasswordMultiBinding'
        , usernameVariable: 'DOCKER_PUSH_USERNAME'
        , passwordVariable: 'DOCKER_PUSH_PASSWORD'
        , credentialsId: 'c61346cf-aca8-4ae6-bee8-e8ccf02eaa12'
        ]
      , [ $class: 'FileBinding'
        , variable: 'GIT_SSH_KEY'
        , credentialsId: 'cfbecb37-737f-4597-86f7-43fb2d3322cc' ]
      ]) {
        construi 'release'
      }
  } else {
    stage 'Build'
    construi 'build'
  }
}
