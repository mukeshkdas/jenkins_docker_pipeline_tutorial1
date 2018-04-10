FROM jenkins:2.60.3

MAINTAINER Kayan Azimov

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY groovy/* /usr/share/jenkins/ref/init.groovy.d/

USER root
RUN mkdir -p /var/jenkins_home/jobs
RUN mkdir -p /var/jenkins_home/.m2/repository
RUN chown -R jenkins:jenkins /var/jenkins_home/jobs
RUN chown -R jenkins:jenkins /var/jenkins_home/.m2/repository
USER jenkins
