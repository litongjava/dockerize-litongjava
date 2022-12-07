#!bin/sh
#启动授权管理器
/etc/init.d/lmadmin start
#启动4路
mount -o size=5128M -o remount /dev/shm
cd /usr/local/Nuance/Krypton
mkdir logs -p
nohup ./startEngine.sh httpPort=8178 httpsPort=8378 --engineUUID=kry8178 >> logs/kry8178.log 2>&1 &
sleep 1
nohup ./startEngine.sh httpPort=8179 httpsPort=8379 --engineUUID=kry8179 >> logs/kry8179.log 2>&1 &
sleep 1
nohup ./startEngine.sh httpPort=8180 httpsPort=8380 --engineUUID=kry8180 >> logs/kry8180.log 2>&1 &
sleep 1
nohup ./startEngine.sh httpPort=8181 httpsPort=8381 --engineUUID=kry8181 >> logs/kry8181.log 2>&1 &
sleep 1
#启动haproxy
cd /opt/haproxy/
mkdir logs -p
nohup haproxy -f haproxy_krypton.cfg >> logs/haproxy.log 2>&1 &
#启动mongodb
nohup /usr/local/mongodb/bin/mongod &
#启动jetty
mkdir -p /opt/jetty-9.4.6/logs
nohup /opt/jetty-9.4.6/bin/jetty.sh run >> logs/jetty.log 2>&1 &
#启动客户端
java -jar /xiaoi-live-rec-client-web-demo.jar