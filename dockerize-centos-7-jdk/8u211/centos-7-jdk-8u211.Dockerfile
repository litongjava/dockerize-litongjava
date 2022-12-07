#构建centos-7-jdk:8u211
FROM centos:7
#设置时间
RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#设置编码
ENV LANG=en_US.utf8
#使用ali yum源
RUN set -ex \
  && rm -rf /etc/yum.repos.d/* \
  && curl -o /etc/yum.repos.d/Centos-7.repo http://mirrors.aliyun.com/repo/Centos-7.repo \
  && curl -o /etc/yum.repos.d/epel-7.repo http://mirrors.aliyun.com/repo/epel-7.repo
#下载地址
ENV DOWN_ADDR=http://192.168.0.10
#安装jdk.1.8
RUN set -ex \
	&& mkdir /usr/java \
	&& curl -O $DOWN_ADDR/jdk/jdk-8u211-linux-x64.tar.gz \
	&& tar -zxf jdk-8u211-linux-x64.tar.gz -C /usr/java \
	&& rm -rf jdk-8u211-linux-x64.tar.gz