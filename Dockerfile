FROM java:7-jdk
MAINTAINER Levi Stephen <levi.stephen@gmail.com>

ENV JENKINS_INSTALL /usr/share/jenkins
RUN mkdir -p ${JENKINS_INSTALL}

COPY JENKINS_VERSION /etc/jenkins-version

RUN curl -ssL http://mirrors.jenkins-ci.org/war/$(cat /etc/jenkins-version)/jenkins.war \
  -o ${JENKINS_INSTALL}/jenkins.war

COPY bin/*.sh ${JENKINS_INSTALL}/
RUN for f in ${JENKINS_INSTALL}/*.sh; do chmod +x $f; done;
RUN for f in ${JENKINS_INSTALL}/*.sh; do ln -s $f /usr/bin/`basename $f`; done;

ENV JENKINS_HOME /var/jenkins
ENV JENKINS_PLUGINS_HOME ${JENKINS_INSTALL}/plugins

RUN mkdir -p ${JENKINS_HOME} && mkdir -p ${JENKINS_PLUGINS_HOME}

RUN install-pinned-plugin.sh antisamy-markup-formatter
RUN install-pinned-plugin.sh credentials
RUN install-pinned-plugin.sh cvs
RUN install-pinned-plugin.sh icon-shim
RUN install-pinned-plugin.sh javadoc
RUN install-pinned-plugin.sh junit
RUN install-pinned-plugin.sh ldap
RUN install-pinned-plugin.sh mailer
RUN install-pinned-plugin.sh matrix-auth
RUN install-pinned-plugin.sh matrix-project
RUN install-pinned-plugin.sh maven-plugin
RUN install-pinned-plugin.sh pam-auth
RUN install-pinned-plugin.sh script-security
RUN install-pinned-plugin.sh ssh-credentials
RUN install-pinned-plugin.sh ssh-slaves
RUN install-pinned-plugin.sh subversion
RUN install-pinned-plugin.sh translation
RUN install-pinned-plugin.sh windows-slaves

RUN install-plugin.sh mapdb-api
RUN install-plugin.sh scm-api

# Jekins 2.0 pluins
RUN install-plugin.sh ace-editor
RUN install-plugin.sh branch-api
RUN install-plugin.sh cloudbees-folder
RUN install-plugin.sh durable-task
RUN install-plugin.sh git-client
RUN install-plugin.sh git-server
RUN install-plugin.sh jquery-detached
RUN install-plugin.sh pipeline-build-step
RUN install-plugin.sh pipeline-input-step
RUN install-plugin.sh pipeline-stage-step
RUN install-plugin.sh structs
RUN install-plugin.sh workflow-aggregator
RUN install-plugin.sh workflow-api
RUN install-plugin.sh workflow-basic-steps
RUN install-plugin.sh workflow-cps
RUN install-plugin.sh workflow-cps-global-lib
RUN install-plugin.sh workflow-durable-task-step
RUN install-plugin.sh workflow-job
RUN install-plugin.sh workflow-multibranch
RUN install-plugin.sh workflow-scm-step
RUN install-plugin.sh workflow-step-api
RUN install-plugin.sh workflow-support

ENTRYPOINT ["/usr/share/jenkins/jenkins-entrypoint.sh"]

EXPOSE 8080
EXPOSE 50000

VOLUME ${JENKINS_HOME}

CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]

