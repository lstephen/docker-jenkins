#!/bin/bash
set -e

if [[ -n "$JENKINS_RESTORE_FROM" ]]
then
  echo "Restoring from ${JENKINS_RESTORE_FROM}..."
  curl $JENKINS_RESTORE_FROM | tar xvf -C $JENKINS_HOME
fi

echo "Copying plugins..."
mkdir -p ${JENKINS_HOME}/plugins
rm -rf ${JENKINS_HOME}/plugins/*
cp ${JENKINS_PLUGINS_HOME}/* ${JENKINS_HOME}/plugins || :

exec "$@"

