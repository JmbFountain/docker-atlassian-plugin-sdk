FROM rockylinux:latest

# Maintainers on this project are the following:
LABEL org.opencontainers.image.authors="johannes@jmbfountain.de"
EXPOSE 2990

RUN yum update -y
RUN yum install vim java-1.8.0-openjdk-headless zip unzip curl wget -y

COPY rpm-repo /etc/yum.repos.d/atlassian.repo

RUN yum clean all -y
RUN yum updateinfo metadata -y
RUN yum install atlassian-plugin-sdk -y

#RUN wget  https://services.gradle.org/distributions/gradle-7.4-bin.zip
#RUN mkdir /opt/gradle/
#RUN unzip -d /opt/gradle gradle-7.4-bin.zip
#RUN echo "PATH=$PATH:/opt/gradle/gradle-7.4/bin" >> /etc/profile

# Create directory for source software
RUN mkdir -p /repo/
WORKDIR /repo/
RUN atlas-version

# Set the default running command of the AMPS image to be running the
# application in debug mode.
CMD ["atlas-debug"]
