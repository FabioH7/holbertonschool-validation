# Dockerfile
FROM jenkins/jenkins:lts-jdk11

# Disable the Jenkins installation wizard
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# Switch to the root user
USER root

# Install hadolint
RUN curl -sL https://github.com/hadolint/hadolint/releases/latest/download/hadolint-Linux-x86_64 -o /usr/local/bin/hadolint \
    && chmod +x /usr/local/bin/hadolint

# Install container-structure-test
RUN curl -sL https://storage.googleapis.com/container-structure-test/latest/container-structure-test-linux-amd64 -o /usr/local/bin/container-structure-test \
    && chmod +x /usr/local/bin/container-structure-test

# Switch back to the Jenkins user
USER jenkins

# Copy the plugins.txt file
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

# Install plugins using jenkins-plugin-cli
RUN jenkins-plugin-cli --plugins < /usr/share/jenkins/ref/plugins.txt

