#构建引擎 
FROM litongjava/centos-7-jdk:8u341

#添加中文支持和工具支持
RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV JAVA_HOME /usr/java/jdk1.8.0_341
ENV PATH=$PATH:$JAVA_HOME/bin/
ENV ENGINE_DIR=/usr/local/ai-engine8

#安装Ai-engine
ENV AI_ENGINE_NAME ai-engine8-20180418.tar.gz
RUN set -ex \
	&& curl -O http://192.168.0.13:3000/ibot/ibot8/20180418/ai-engine8-20180418.tar.gz \
	&& tar -zxf $AI_ENGINE_NAME -C /usr/local/ && rm -rf $AI_ENGINE_NAME

COPY docker-knity.sh /docker-knity.sh
RUN chmod u+x docker-knity.sh
EXPOSE 90/tcp
#启动引擎
CMD ["/docker-knity.sh"]