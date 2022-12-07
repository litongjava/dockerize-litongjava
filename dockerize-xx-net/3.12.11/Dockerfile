FROM debian:jessie
#设置语言和编码
ENV LANG=C.UTF-8
#设置apt源,安装依赖软件
RUN set -ex \
    && { \
        echo 'deb http://mirrors.aliyun.com/debian/ jessie main non-free contrib'; \
        echo 'deb http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib'; \
        echo 'deb-src http://mirrors.aliyun.com/debian/ jessie main non-free contrib'; \
        echo 'deb-src http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib'; \
    } > /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y miredo python-pip wget \
	&& rm -rf /var/lib/apt/lists/*
#安装xx-net
RUN set -ex \
    && mkdir -p /data/xxnet \
    && wget -c -O /data/xxnet.tar.gz "http://download.uairobot.com/xxnet/3.12.11/XX-Net-3.12.11.tar.gz" \
    && tar -xf /data/xxnet.tar.gz -C /data/xxnet --strip-components=1 \
    && rm -f /data/xxnet.tar.gz 
#设置supervisor
RUN set -ex \
    && pip install supervisor
#添加supervisord配置文件
COPY conf/supervisord/supervisord.conf /etc/supervisord.conf
#删除多余软件
RUN set -ex \
	&& apt-get -y purge wget
#释出端口
EXPOSE 1080 8085 8086 8087
#启动程序
ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
