## buid
```
docker build -t litongjava/frp:0.29.1-alpine .
```
## run
```
docker run -d -p 80:80 --name frp-server litongjava/frp:0.29.1-alpine
```
## client
wget https://github.com/fatedier/frp/releases/download/v0.29.1/frp_0.29.1_linux_amd64.tar.gz
tar -xf frp_0.29.1_linux_amd64.tar.gz
cd frp_0.29.1_linux_amd64/