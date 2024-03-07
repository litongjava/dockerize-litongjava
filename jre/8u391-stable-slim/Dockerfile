FROM debian:stable-slim

RUN set -ex \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends curl \
	&& curl -O http://192.168.3.8:3000/jre/8u391/jre-8u391-linux-x64.tar.gz \
	&& mkdir /usr/java \
	&& tar -zxf jre-8u391-linux-x64.tar.gz -C /usr/java \
	&& rm -rf jre-8u391-linux-x64.tar.gz \
	&& apt-get remove -y curl \
    && apt-get autoremove -y \
	&& apt-get clean \
    && rm -rf /var/lib/apt/lists/*
	

ENV JAVA_HOME=/usr/java/jre1.8.0_391 \
    PATH=$PATH:/usr/java/jre1.8.0_391/bin