#构建TreeNMS-1.7.4
FROM centos:6.9
#设置时间
RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#设置编码
ENV LANG=en_US.utf8
ENV DOWN_ADDR=http://192.168.0.10
#安装jdk.1.8
RUN set -ex \
	&& mkdir /usr/java \
	&& curl -O $DOWN_ADDR/jdk/jdk-8u211-linux-x64.tar.gz \
	&& tar -zxf jdk-8u211-linux-x64.tar.gz -C /usr/java \
	&& rm -rf jdk-8u211-linux-x64.tar.gz
#设置yum源
RUN set -ex \
	&& rm -rf /etc/yum.repos.d/* \
	&& curl -o /etc/yum.repos.d/Centos-6.repo http://mirrors.aliyun.com/repo/Centos-6.repo \
	&& curl -o /etc/yum.repos.d/epel-6.repo http://mirrors.aliyun.com/repo/epel-6.repo
#安装treesoft
RUN set -ex \	
	&& curl -O $DOWN_ADDR/treesoft/treeNMS-1.7.4.tar.gz \
	&& tar -xf treeNMS-1.7.4.tar.gz -C /opt/ \
	&& rm -rf treeNMS-1.7.4.tar.gz
#设置classpath,添加启动权限
RUN set -ex \
	&& { \
    echo '#!/bin/sh'; \
    echo 'JAVA_HOME=/usr/java/jdk1.8.0_211'; \
    echo 'JRE_HOME=$JAVA_HOME/jre'; \
	  echo '_RUNJAVA=$JRE_HOME/bin/java'; \
	} > /opt/TreeNMS-1.7.4/bin/setclasspath.sh \
	&& chmod u+x /opt/TreeNMS-1.7.4/bin/*
#添加端口
EXPOSE 8080
#启动服务
CMD ["/opt/TreeNMS-1.7.4/bin/catalina.sh","run"]