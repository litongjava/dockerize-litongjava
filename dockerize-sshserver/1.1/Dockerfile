FROM centos:7.4.1708
#设置时间
RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#设置编码
ENV LANG=en_US.utf8
#设置aliyun的yum源
#使用ali yum源
RUN set -ex \
	&& rm -rf /etc/yum.repos.d/* \
	&& curl -o /etc/yum.repos.d/Centos-7.repo http://mirrors.aliyun.com/repo/Centos-7.repo \
  && curl -o /etc/yum.repos.d/epel-7.repo http://mirrors.aliyun.com/repo/epel-7.repo

#安装SSH服务
RUN yum install -y openssh-server && yum clean all
#添加必要的密钥
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key
RUN ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key
#设置root密码
RUN echo "00000000" |passwd --stdin root

#添加启动文件
ADD run.sh /root/run.sh
RUN chmod 775 /root/run.sh
#导出端口
EXPOSE 22
#设置默认启动命令
CMD ["/root/run.sh"]