# frp
frp已经可以自动识别tcp协议可以http协议
- 监听80端口,支持tcp协议和http协议
- 注册时使用tcp协议
- 转发时使用http协议

FROM alpine

wget https://github.com/fatedier/frp/releases/download/v0.58.0/frp_0.58.0_linux_amd64.tar.gz
mv /opt/frp_0.58.0_linux_amd64/ /opt/frp
vi /opt/frp/frps.toml
```
bindPort = 80
vhostHttpPort=80
```
启动服务
```
/opt/frp/frps -c /opt/frp/frps.toml
```