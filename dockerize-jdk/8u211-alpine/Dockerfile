FROM alpine
RUN set -ex \
&& apk add --no-cache curl\
&& mkdir /usr/java/ \
&& curl -O http://192.168.3.8:3000/jdk/jdk-8u341/jdk-8u341-linux-x64.tar.gz \
&& tar -zxf jdk-8u341-linux-x64.tar.gz -C /usr/java/ \
&& rm -rf jdk-8u341-linux-x64.tar.gz \
&& apk del curl \
&& rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

ENV JAVA_HOME=/usr/java/jdk1.8.0_211
#设置path启动容器后失效
#ENV PATH=$JAVA_HOME/bin:$PATH

#构建失败,不支持glibc