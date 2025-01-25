FROM litongjava/libreoffice:1.0.0

RUN set -ex \
  && curl -L -O https://github.com/litongjava/oracle-jdk/releases/download/8u3418u391/jdk-8u391-linux-x64.tar.gz \
  && mkdir /usr/java \
  && tar -zxf jdk-8u391-linux-x64.tar.gz -C /usr/java \
  && rm -rf jdk-8u391-linux-x64.tar.gz
  
ENV JAVA_HOME=/usr/java/jdk1.8.0_391 \
    PATH=$PATH:/usr/java/jdk1.8.0_391/bin
