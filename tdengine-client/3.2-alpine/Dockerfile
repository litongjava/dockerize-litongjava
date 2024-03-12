FROM alpine

RUN set -ex \
&& apk add --no-cache curl \
#download and clean
&& curl -O http://192.168.3.8:3000/TDengine-client/TDengine-client-3.2.2.0-Linux-x64.tar.gz \
&& tar -xf TDengine-client-3.2.2.0-Linux-x64.tar.gz \
&& cd TDengine-client-3.2.2.0 && ./install_client.sh \
&& cd .. && rm -rf /app/TDengine-client-3.2.2.0 && rm -rf /app/TDengine-client-3.2.2.0-Linux-x64.tar.gz \
# clean    
&& rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

/TDengine-client-3.2.2.0 # ./install_client.sh 
ash: ./install_client.sh: not found
