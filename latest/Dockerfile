FROM java:8-jdk
MAINTAINER Levi Stephen <levi.stephen@gmail.com>

ENV JENKINS_INSTALL /usr/share/jenkins
RUN mkdir -p ${JENKINS_INSTALL}

RUN curl -L http://mirrors.jenkins-ci.org/war/latest/jenkins.war -o ${JENKINS_INSTALL}/jenkins.war

COPY *.sh ${JENKINS_INSTALL}/
RUN for f in ${JENKINS_INSTALL}/*.sh; do chmod +x $f; done;
RUN for f in ${JENKINS_INSTALL}/*.sh; do ln -s $f /usr/bin/`basename $f`; done;

ENV JENKINS_HOME /var/jenkins
RUN mkdir -p ${JENKINS_HOME}

ENV JENKINS_PLUGINS_HOME ${JENKINS_INSTALL}/plugins
RUN mkdir -p ${JENKINS_PLUGINS_HOME}

RUN install-pinned-plugin.sh antisamy-markup-formatter
RUN install-pinned-plugin.sh credentials
RUN install-pinned-plugin.sh cvs
RUN install-pinned-plugin.sh javadoc
RUN install-pinned-plugin.sh junit
RUN install-pinned-plugin.sh ldap
RUN install-pinned-plugin.sh mailer
RUN install-pinned-plugin.sh matrix-auth
RUN install-pinned-plugin.sh maven-plugin
RUN install-pinned-plugin.sh pam-auth
RUN install-pinned-plugin.sh script-security
RUN install-pinned-plugin.sh ssh-credentials
RUN install-pinned-plugin.sh subversion
RUN install-pinned-plugin.sh translation

RUN install-plugin.sh mapdb-api
RUN install-plugin.sh scm-api

ENTRYPOINT ["/usr/share/jenkins/jenkins-entrypoint.sh"]

EXPOSE 8080
EXPOSE 50000

VOLUME ${JENKINS_HOME}

CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]

