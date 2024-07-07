FROM centos:7.4.1708

# 设置编码
ENV LANG=en_US.utf8

# 安装 SSH 和 Nginx 服务，并添加必要的密钥和设置 root 密码
RUN yum install -y openssh-server net-tools epel-release && \
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key && \
    echo "00000000" | passwd --stdin root && \
    yum clean all && \
    rm -rf /var/cache/yum

# 安装 Nginx 和常用开发工具
RUN yum install -y nginx unzip curl wget which python3-pip gcc gcc-c++ nmap \
    && pip3 install --upgrade pip && pip3 install --upgrade setuptools \
    && pip3 install jupyterlab \
    && yum clean all \
    && rm -rf /var/cache/yum \
    && mkdir -p /usr/share/nginx/logs/

# 配置 Nginx
COPY nginx/ /etc/nginx/

# 安装 websocket-sshd-server
RUN curl -O http://192.168.3.8:3000/websocket-sshd-server/websocket-sshd-server-linux-amd64-v1.0.0.tar.gz \
    && tar -xf websocket-sshd-server-linux-amd64-v1.0.0.tar.gz -C /usr/local/ \
    && rm -rf websocket-sshd-server-linux-amd64-v1.0.0.tar.gz

# 安装 Java
RUN set -ex \
  && curl -O http://192.168.3.8:3000/jdk/jdk-8u391/jdk-8u391-linux-x64.tar.gz \
  && mkdir /usr/java \
  && tar -zxf jdk-8u391-linux-x64.tar.gz -C /usr/java \
  && rm -rf jdk-8u391-linux-x64.tar.gz

# 安装 Golang
RUN set -ex \
  && curl -O http://192.168.3.8:3000/go/go1.22.3.linux-amd64.tar.gz \
  && tar -C /usr/local -xzf go1.22.3.linux-amd64.tar.gz \
  && rm -rf go1.22.3.linux-amd64.tar.gz

## glibc
RUN set -ex \
&& curl -O http://192.168.3.8:3000/glibc/glibc-2.25.tar.gz \
&& tar -xf glibc-2.25.tar.gz && mkdir glibc-2.25-build/ && cd glibc-2.25-build/ \
&& ../glibc-2.25/configure --prefix=/usr --disable-profile --enable-add-ons --with-headers=/usr/include --with-binutils=/usr/bin \
&& make -j$(nproc) && make install \
&& cd .. && rm -rf glibc-2.25.tar.gz glibc-2.25-build/ 

# install bun
RUN set -ex \
&& curl -O http://192.168.3.8:3000/bun/bun-linux-x64.zip \
&& unzip bun-linux-x64.zip \
&& mv bun-linux-x64/bun /usr/bin

ENV JAVA_HOME=/usr/java/jdk1.8.0_391 \
    PATH=$PATH:/usr/java/jdk1.8.0_391/bin:/usr/local/go/bin:$HOME/go/bin

# 添加启动文件
ADD run.sh /run.sh
RUN chmod 775 /run.sh

# 导出端口
EXPOSE 80

# 设置默认启动命令
CMD ["/run.sh"]
