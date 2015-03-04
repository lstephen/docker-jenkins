#!/bin/bash

install-plugin.sh $1

touch ${JENKINS_PLUGINS_HOME}/$1.jpi.pinned

