FROM debian:stable-slim

RUN set -ex \
  && apt-get update \
  && apt-get install -y --no-install-recommends curl iproute2 procps \
  && curl -O http://192.168.3.9:3000/jdk/jdk-17.0.12/jdk-17.0.12_linux-x64_bin.tar.gz \
  && mkdir /usr/java -p \
  && tar -zxf jdk-17.0.12_linux-x64_bin.tar.gz -C /usr/java \
  && rm -rf jdk-17.0.12_linux-x64_bin.tar.gz \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
  

ENV JAVA_HOME=/usr/java/jdk-17.0.12 \
    PATH=$PATH:/usr/java/jdk-17.0.12/bin
	
	