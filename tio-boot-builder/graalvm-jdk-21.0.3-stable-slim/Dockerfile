FROM debian:stable-slim

RUN set -ex \
&& apt-get update \
&& apt-get install -y --no-install-recommends ca-certificates curl unzip gcc git zlib1g-dev \
&& curl -O https://download.oracle.com/graalvm/21/latest/graalvm-jdk-21_linux-x64_bin.tar.gz \
&& mkdir /usr/java \
&& tar -zxf graalvm-jdk-21_linux-x64_bin.tar.gz -C /usr/java \
&& rm -rf graalvm-jdk-21_linux-x64_bin.tar.gz \
&& curl -O  https://dlcdn.apache.org/maven/maven-3/3.8.8/binaries/apache-maven-3.8.8-bin.zip \
&& mkdir /usr/maven \
&& unzip apache-maven-3.8.8-bin.zip -d /usr/maven \
&& rm -rf apache-maven-3.8.8-bin.zip \
&& apt-get autoremove -y \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/java/graalvm-jdk-21.0.3+7.1 \
    GRAALVM_HOME=/usr/java/graalvm-jdk-21.0.3+7.1 \
    MVN_HOME=/usr/maven/apache-maven-3.8.8
ENV PATH=$JAVA_HOME/bin:$MVN_HOME/bin:$PATH


RUN set -ex \
&& echo $PATH \
&& git clone https://github.com/litongjava/tio-utils.git && cd tio-utils && mvn clean install -DskipTests -Dgpg.skip && cd .. \
&& git clone https://github.com/litongjava/t-io.git && cd t-io && mvn clean install -DskipTests -Dgpg.skip && cd .. \
&& git clone https://github.com/litongjava/tio-http.git \
&& cd tio-http/tio-http-common/ && mvn clean install -DskipTests -Dgpg.skip \
&& cd ../tio-http-server && mvn clean install -DskipTests -Dgpg.skip \
&& git clone https://github.com/litongjava/tio-boot.git && cd tio-boot && mvn clean install -DskipTests -Dgpg.skip

## test llm-proxy
RUN set -ex \
&& git clone https://github.com/litongjava/llm-proxy.git && cd llm-proxy && mvn clean package -DskipTests -Pnative && ls target

CMD ["/llm-proxy/target/llm-proxy"]