FROM bitnami/minideb

LABEL image "gcr.io/example/example.base:0.0.1-SNAPSHOT"
LABEL description "base image"
LABEL maintainer "John Doe <john.doe@example.org>"

# install some development and debug tools. Not recommended for production!
RUN \
  apt-get update && \
  apt-get install -y --force-yes \
  wget \
  curl \
  jq \
  gnupg2

# install oracle java
ENV JAVA_VER 8
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
RUN  \
	echo 'deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main' >> /etc/apt/sources.list && \
    echo 'deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main' >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C2518248EEA14886 && \
    apt-get update && \
    echo oracle-java${JAVA_VER}-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y --force-yes --no-install-recommends oracle-java${JAVA_VER}-installer oracle-java${JAVA_VER}-set-default && \
    apt-get clean && \
    rm -rf /var/cache/oracle-jdk${JAVA_VER}-installer
RUN update-java-alternatives -s java-8-oracle && \
	echo "export JAVA_HOME=${JAVA_HOME}" >> ~/.bashrc && \
	echo "export PATH=$PATH:$JAVA_HOME/bin" >> ~/.bashrc

# clean-up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/bin/sh"]