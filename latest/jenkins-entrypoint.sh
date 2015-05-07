#!/bin/bash
set -e

if [[ -n "$JENKINS_RESTORE_FROM" ]]
then
  if [[ -f "${JENKINS_HOME}/.restored" ]]
  then
    echo "Skipping restore due to ${JENKINS_HOME}/.restored"
  else
    echo "Restoring from ${JENKINS_RESTORE_FROM}..."
    curl $JENKINS_RESTORE_FROM | tar zxvf - -C $JENKINS_HOME
  fi
else
  [[ -f "${JENKINS_HOME}/.restored" ]] && rm ${JENKINS_HOME}/.restored
fi

echo "Copying plugins..."
rm -rf ${JENKINS_HOME}/plugins
mkdir -p ${JENKINS_HOME}/plugins
cp ${JENKINS_PLUGINS_HOME}/* ${JENKINS_HOME}/plugins || :

exec "$@"

