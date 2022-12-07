#����treeDMS-2.3.4
FROM centos:6.9
#����ʱ��
RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#���ñ���
ENV LANG=en_US.utf8
#��װjdk.1.8
RUN set -ex \
	&& mkdir /usr/java \
	&& curl -O http://192.168.10.126/jdk/linux/jdk-8u211-linux-x64.tar.gz \
	&& tar -zxf jdk-8u211-linux-x64.tar.gz -C /usr/java \
	&& rm -rf jdk-8u211-linux-x64.tar.gz
#����yumԴ
RUN set -ex \
	&& rm -rf /etc/yum.repos.d/* \
	&& curl -o /etc/yum.repos.d/Centos-6.repo http://mirrors.aliyun.com/repo/Centos-6.repo \
	&& curl -o /etc/yum.repos.d/epel-6.repo http://mirrors.aliyun.com/repo/epel-6.repo
#��װunzip 
RUN set -ex \
	&& yum -y install unzip && yum clean all
#��װtreesoft
RUN set -ex \	
	&& curl -O http://192.168.10.126/treesoft/treeDMS-2.3.4.zip \
	&& unzip treeDMS-2.3.4.zip -d /opt/ \
	&& rm -rf treeDMS-2.3.4.zip
#����classpath,�������Ȩ��
RUN set -ex \
	&& { \
    echo '#!/bin/sh'; \
    echo 'JAVA_HOME=/usr/java/jdk1.8.0_211'; \
    echo 'JRE_HOME=$JAVA_HOME/jre'; \
	echo '_RUNJAVA=$JRE_HOME/bin/java'; \
	} > /opt/treeDMS-2.3.4/bin/setclasspath.sh \
	&& chmod u+x /opt/treeDMS-2.3.4/bin/*
#��Ӷ˿�
EXPOSE 8085
#��������
CMD ["/opt/treeDMS-2.3.4/bin/catalina.sh","run"]