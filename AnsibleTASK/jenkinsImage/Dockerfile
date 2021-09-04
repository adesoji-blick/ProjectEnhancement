# Jenkins Image with required plugins and no initial setup

FROM avastmick/ansible-jenkins
LABEL maintainer="adesoji@blick.ng"

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Install required plugins
COPY jenkins_plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt

USER root
RUN apk add docker
RUN apk add py-pip

USER jenkins