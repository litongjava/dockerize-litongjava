# Use Alpine Linux as the base image
FROM alpine:latest

# Install necessary packages
RUN apk --no-cache add wget tar

# Download frp
RUN wget https://github.com/fatedier/frp/releases/download/v0.58.0/frp_0.58.0_linux_amd64.tar.gz -O /tmp/frp.tar.gz && \
    tar -zxvf /tmp/frp.tar.gz -C /opt && \
    mv /opt/frp_0.58.0_linux_amd64 /opt/frp && \
    rm /tmp/frp.tar.gz

# copy
COPY frps.toml /opt/frp/frps.toml

# Expose necessary ports
EXPOSE 80

# Set the working directory
WORKDIR /opt/frp

# Command to start FRP server
CMD ["./frps", "-c", "frps.toml"]
