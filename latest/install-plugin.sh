#!/bin/bash

curl -L http://updates.jenkins-ci.org/latest/$1.hpi \
     -o ${JENKINS_PLUGINS_HOME}/$1.hpi

