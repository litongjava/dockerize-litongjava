# Use Alpine Linux as the base image
FROM alpine:latest

# Install necessary packages
RUN apk --no-cache add wget tar

# Download
RUN wget http://192.168.3.8:3000/v2ray/v2ray-v5.16.1-linux-64.tar.gz && \
    tar -zxvf v2ray-v5.16.1-linux-64.tar.gz -C /opt && \
    rm v2ray-v5.16.1-linux-64.tar.gz

# Expose necessary ports
EXPOSE 10086

# Set the working directory
WORKDIR /opt/v2ray

# Command to start FRP server
CMD ["./v2ray", "run"]
