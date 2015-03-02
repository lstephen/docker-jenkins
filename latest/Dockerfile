FROM java:8-jdk
MAINTAINER Levi Stephen <levi.stephen@gmail.com>

ENV JENKINS_INSTALL /usr/share/jenkins
RUN mkdir -p ${JENKINS_INSTALL}

RUN curl -L http://mirrors.jenkins-ci.org/war/latest/jenkins.war -o ${JENKINS_INSTALL}/jenkins.war

ENV JENKINS_HOME /var/jenkins
RUN mkdir -p ${JENKINS_HOME}

ENV JENKINS_PLUGINS_HOME ${JENKINS_INSTALL}/plugins
RUN mkdir -p ${JENKINS_PLUGINS_HOME}

RUN curl -L http://updates.jenkins-ci.org/latest/credentials.hpi \
         -o ${JENKINS_PLUGINS_HOME}/credentials.hpi \
 && touch ${JENKINS_PLUGINS_HOME}/credentials.jpi.pinned

RUN curl -L http://updates.jenkins-ci.org/latest/cvs.hpi \
         -o ${JENKINS_PLUGINS_HOME}/cvs.hpi \
 && touch ${JENKINS_PLUGINS_HOME}/cvs.jpi.pinned

RUN curl -L http://updates.jenkins-ci.org/latest/javadoc.hpi \
         -o ${JENKINS_PLUGINS_HOME}/javadoc.hpi \
 && touch ${JENKINS_PLUGINS_HOME}/javadoc.jpi.pinned

RUN curl -L http://updates.jenkins-ci.org/latest/junit.hpi \
         -o ${JENKINS_PLUGINS_HOME}/junit.hpi \
 && touch ${JENKINS_PLUGINS_HOME}/junit.jpi.pinned

RUN curl -L http://updates.jenkins-ci.org/latest/ldap.hpi \
         -o ${JENKINS_PLUGINS_HOME}/ldap.hpi \
 && touch ${JENKINS_PLUGINS_HOME}/ldap.jpi.pinned

RUN curl -L http://updates.jenkins-ci.org/latest/mailer.hpi \
         -o ${JENKINS_PLUGINS_HOME}/mailer.hpi \
 && touch ${JENKINS_PLUGINS_HOME}/mailer.jpi.pinned

RUN curl -L http://updates.jenkins-ci.org/latest/matrix-auth.hpi \
         -o ${JENKINS_PLUGINS_HOME}/matrix-auth.hpi \
 && touch ${JENKINS_PLUGINS_HOME}/matrix-auth.jpi.pinned

RUN curl -L http://updates.jenkins-ci.org/latest/maven-plugin.hpi \
         -o ${JENKINS_PLUGINS_HOME}/maven-plugin.hpi \
 && touch ${JENKINS_PLUGINS_HOME}/maven-plugin.jpi.pinned

RUN curl -L http://updates.jenkins-ci.org/latest/antisamy-markup-formatter.hpi \
         -o ${JENKINS_PLUGINS_HOME}/antisamy-markup-formatter.hpi \
 && touch ${JENKINS_PLUGINS_HOME}/antisamy-markup-formatter.jpi.pinned

RUN curl -L http://updates.jenkins-ci.org/latest/pam-auth.hpi \
         -o ${JENKINS_PLUGINS_HOME}/pam-auth.hpi \
 && touch ${JENKINS_PLUGINS_HOME}/pam-auth.jpi.pinned

RUN curl -L http://updates.jenkins-ci.org/latest/subversion.hpi \
         -o ${JENKINS_PLUGINS_HOME}/subversion.hpi \
 && touch ${JENKINS_PLUGINS_HOME}/subversion.jpi.pinned

RUN curl -L http://updates.jenkins-ci.org/latest/translation.hpi \
         -o ${JENKINS_PLUGINS_HOME}/translation.hpi \
 && touch ${JENKINS_PLUGINS_HOME}/translation.jpi.pinned

RUN curl -L http://updates.jenkins-ci.org/latest/mapdb-api.hpi \
         -o ${JENKINS_PLUGINS_HOME}/mapdb-api.hpi

RUN curl -L http://updates.jenkins-ci.org/latest/scm-api.hpi \
         -o ${JENKINS_PLUGINS_HOME}/scm-api.hpi

COPY jenkins-entrypoint.sh /
RUN chmod +x /jenkins-entrypoint.sh

ENTRYPOINT ["/jenkins-entrypoint.sh"]

EXPOSE 8080
EXPOSE 50000

VOLUME ${JENKINS_HOME}

CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]

