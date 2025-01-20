FROM debian:stable-slim

RUN set -ex \
  && apt-get update \
  && apt-get install -y --no-install-recommends curl iproute2 procps \
  && curl -O http://192.168.3.9:3000/jdk/jdk-8u411/jdk-8u411-linux-x64.tar.gz \
  && mkdir /usr/java \
  && tar -zxf jdk-8u411-linux-x64.tar.gz -C /usr/java \
  && rm -rf jdk-8u411-linux-x64.tar.gz \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
  

ENV JAVA_HOME=/usr/java/jdk1.8.0_411 \
    PATH=$PATH:/usr/java/jdk1.8.0_411/bin