FROM centos:7.4.1708
#设置时间
RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#设置编码
ENV LANG=en_US.utf8

#安装SSH and # nginx服务 and #添加必要的密钥 and #设置root密码
RUN yum install -y openssh-server net-tools epel-release && \
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key && \
    echo "00000000" |passwd --stdin root && \
    yum clean all

# install nginx/
RUN yum install -y nginx && mkdir -p /usr/share/nginx/logs/

# Config Nginx
COPY nginx/ /etc/nginx/

# Install websocket-sshd-server
RUN curl -O http://192.168.3.8:3000/websocket-sshd-server/websocket-sshd-server-linux-amd64-v1.0.0.tar.gz \
	&& tar -xf websocket-sshd-server-linux-amd64-v1.0.0.tar.gz -C /usr/local/ \
	&& rm -rf websocket-sshd-server-linux-amd64-v1.0.0.tar.gz

#添加启动文件
ADD run.sh /run.sh
RUN chmod 775 /run.sh

#导出端口
EXPOSE 80
#设置默认启动命令
CMD ["/run.sh"]
