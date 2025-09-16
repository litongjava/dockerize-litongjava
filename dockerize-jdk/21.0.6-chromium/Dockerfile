FROM debian:stable-slim

RUN set -ex \
  && apt-get update \
  && apt-get install -y --no-install-recommends curl iproute2 procps unzip ca-certificates chromium \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/* 

RUN set -ex \
  && curl -O -L https://github.com/litongjava/oracle-jdk/releases/download/21.0.6/jdk-21_linux-x64_bin.tar.gz \
  && mkdir /usr/java \
  && tar -xf jdk-21_linux-x64_bin.tar.gz -C /usr/java \
  && rm -rf jdk-21_linux-x64_bin.tar.gz
  
COPY playwright-java-cache /root/.cache
  
ENV JAVA_HOME=/usr/java/jdk-21.0.6 \
    PATH=$PATH:/usr/java/jdk-21.0.6/bin
