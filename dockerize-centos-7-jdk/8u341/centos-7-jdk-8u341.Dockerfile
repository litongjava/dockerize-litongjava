#构建centos-7-jdk:8u341
FROM centos:7

#安装jdk.1.8
#不推荐使用copy,因为copy会产生一个新的层,并且无法删除
#COPY jdk-8u341-linux-x64.tar.gz jdk-8u341-linux-x64.tar.gz

RUN set -ex \
	&& curl -O http://192.168.0.13:3000/jdk/jdk-8u341-linux-x64.tar.gz \
	&& mkdir /usr/java \
	&& tar -zxf jdk-8u341-linux-x64.tar.gz -C /usr/java \
	&& rm -rf jdk-8u341-linux-x64.tar.gz