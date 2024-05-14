FROM alpine:latest

# 更新 apk 并安装 ca-certificates 和 tzdata
RUN apk update && \
    apk add --no-cache ca-certificates tzdata && \
    # 清理 apk 缓存
    rm -rf /var/cache/apk/*
