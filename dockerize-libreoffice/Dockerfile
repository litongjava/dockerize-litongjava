FROM ubuntu:24.04

# 安装 软件
RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \    
    apt-get install -y --no-install-recommends curl wget tzdata locales xfonts-utils fontconfig libreoffice-nogui && \
    localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias zh_CN.UTF-8 && locale-gen zh_CN.UTF-8 && \
    apt-get install -y --no-install-recommends ttf-mscorefonts-installer ttf-wqy-microhei ttf-wqy-zenhei xfonts-wqy && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 内置一些常用的中文字体，避免普遍性乱码
ADD fonts/* /usr/share/fonts/chinese/

# 安装字体
RUN cd /usr/share/fonts/chinese && mkfontscale && mkfontdir && fc-cache -fv

ENV LANG=zh_CN.UTF-8 LC_ALL=zh_CN.UTF-8