FROM debian:stable-slim

RUN set -ex \
  && apt-get update \
  && apt-get install -y --no-install-recommends curl chromium \
  && curl -O https://github.com/litongjava/oracle-jdk/releases/download/8u3418u391/jdk-8u391-linux-x64.tar.gz \
  && mkdir /usr/java \
  && tar -zxf jdk-8u391-linux-x64.tar.gz -C /usr/java \
  && rm -rf jdk-8u391-linux-x64.tar.gz \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*
  

ENV JAVA_HOME=/usr/java/jdk1.8.0_391 \
    PATH=$PATH:/usr/java/jdk1.8.0_391/bin