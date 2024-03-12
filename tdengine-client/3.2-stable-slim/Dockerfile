FROM debian:stable-slim


RUN set -ex \
&& apt-get update \
&& apt-get install -y curl \
&& curl -O http://192.168.3.8:3000/TDengine-client/TDengine-client-3.2.2.0-Linux-x64.tar.gz \
&& tar -xf TDengine-client-3.2.2.0-Linux-x64.tar.gz \
&& cd TDengine-client-3.2.2.0 && ./install_client.sh \
&& cd .. && rm -rf /app/TDengine-client-3.2.2.0 && rm -rf /app/TDengine-client-3.2.2.0-Linux-x64.tar.gz \
&& apt-get clean && rm -rf /var/lib/apt/lists/*