#docker build -t litongjava/kod_explorer:4.37 .
FROM centos:6.9
#设置时间
RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#设置语言
ENV LANG=en_US.utf8

#使用阿里yum源
RUN set -ex \
	&& rm -rf /etc/yum.repos.d/* \
	&& curl -o /etc/yum.repos.d/Centos-6.repo http://mirrors.aliyun.com/repo/Centos-6.repo \
	&& curl -o /etc/yum.repos.d/epel-6.repo http://mirrors.aliyun.com/repo/epel-6.repo
#安装可道云
RUN set -ex \
	&& yum -y install httpd php php-devel php-mysql php-gd php-imap php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring unzip \
	&& yum clean all \
	&& curl -O http://download.uairobot.com/kod_explorer/4.37/kodexplorer4.37.zip \
	&& unzip kodexplorer4.37.zip -d /var/www/html && rm -rf kodexplorer4.37.zip \
	&& yum -y remove unzip
#映射端口
EXPOSE 80
#启动httpd
COPY httpd-foreground /usr/local/bin/
RUN chmod +x /usr/local/bin/httpd-foreground
CMD ["httpd-foreground"]
