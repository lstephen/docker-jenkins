properties(
  [ [$class: 'BuildDiscarderProperty', strategy: [$class: 'LogRotator', daysToKeepStr: '30'] ]
  , [$class: 'GithubProjectProperty', projectUrlStr: 'http://github.com/lstephen/docker-jenkins']
  ])

def construi(target)
  wrap([$class: 'AnsiColorBuildWrapper', colorMapName: 'xterm']) {
    sh "construi ${target}"
  }
end

node('construi') {
  stage 'Checkout'
  checkout scm

  if (BRANCH_NAME == 'master') {
    stage 'Deploy'

    withCredentials(
      [
        [ $class: 'UsernamePasswordMultiBinding'
        , usernameVariable: 'DOCKER_USERNAME'
        , passwordVariable: 'DOCKER_PASSWORD'
        , credentialsId: 'c61346cf-aca8-4ae6-bee8-e8ccf02eaa12'
        ]
      , [ $class: 'FileBinding'
        , variable: 'GIT_SSH_KEY'
        , credentialsId: 'cfbecb37-737f-4597-86f7-43fb2d3322cc' ]
      ]) {
        construi 'deploy'
      }
  } else {
    stage 'Build'
    construi 'build'
  }
}
