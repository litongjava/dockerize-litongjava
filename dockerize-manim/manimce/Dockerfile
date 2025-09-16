FROM python:3.13-slim
ENV DEBIAN_FRONTEND=noninteractive PYTHONUNBUFFERED=1

# 避免交互
ENV DEBIAN_FRONTEND=noninteractive

# 1) 核心工具与证书
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates wget curl \
 && rm -rf /var/lib/apt/lists/*

# 2) Python 运行环境
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-pip python3-venv python3-setuptools python3-wheel python3-dev \
 && rm -rf /var/lib/apt/lists/*

# 3) 构建工具链
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential pkg-config cmake meson ninja-build \
 && rm -rf /var/lib/apt/lists/*

# 4) 图形/文本渲染依赖（Manim/Matplotlib 常用）
RUN apt-get update && apt-get install -y --no-install-recommends \
    libcairo2-dev libpango1.0-dev \
 && rm -rf /var/lib/apt/lists/*

# 5) 媒体与编解码器
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg libmp3lame0 \
 && rm -rf /var/lib/apt/lists/*

# 6) TeX（体积较大，放单独一步）
RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-full \
 && rm -rf /var/lib/apt/lists/*

# 7) 安装svg相关库
RUN apt-get update && apt-get install -y --no-install-recommends \
    dvisvgm ghostscript \
 && rm -rf /var/lib/apt/lists/*

# 8) CJK 字体
RUN apt-get update && apt-get install -y --no-install-recommends \
    fonts-noto-cjk \
 && fc-cache -fv \
 && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /
RUN python3 --version && python3 -m pip install --no-cache-dir -r requirements.txt 

COPY binomial_square.py /
RUN manim -ql binomial_square.py && rm -rf media