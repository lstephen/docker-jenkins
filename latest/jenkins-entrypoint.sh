#!/bin/bash
set -e

echo "Copying plugins..."
mkdir -p ${JENKINS_HOME}/plugins
rm ${JENKINS_HOME}/*
cp ${JENKINS_PLUGINS_HOME}/* ${JENKINS_HOME}/plugins || :

exec "$@"

