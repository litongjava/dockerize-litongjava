#!/bin/sh
echo "开始启动mysql"
/etc/init.d/mysqld start
#FRONT_CONSOLE_CONTEXT_PATH eg http://www.xxx.com/front-console
echo $FRONT_CONSOLE_CONTEXT_PATH
#测试成功
sed -i.ori 's#front.console.root.path=http://172.16.8.21:7001/front-console#front.console.root.path='$FRONT_CONSOLE_CONTEXT_PATH'#' $FRONT_CONSOLE_CONFIG_PROPERTIES
sed -i.ori 's#http://172.16.8.21:7001/front-console#'$FRONT_CONSOLE_CONTEXT_PATH'#' $IFRAMRBASE_JS
#设置子系统标识为为cqbank.zny
mysql -uibotfrontconsole -pibotfrontconsole -h127.0.0.1 -e "update ibotfrontconsole.um_right set \`key\`=REPLACE(\`key\`,'cloud.zny','cqbank.zny');"
echo "子系统标识替换成功"
#设置backend地址
[ ! -z ${BACKEND_URL} ] && mysql -uibotfrontconsole -pibotfrontconsole -h127.0.0.1 -e "update ibotfrontconsole.um_right set url =REPLACE(url,'http://172.16.8.21:8088/robot-dev/','${BACKEND_URL}');"
echo "backend替换成功"
#创建日志保存目录,如果使用jetty,会自动创建
mkdir -p /opt/logs
echo "entrypont end"
echo "开始启动JETTY"
java -Xmn1024M -Xms2048M -Xmx2048M -XX:MaxPermSize=512M -Xconcurrentio \
-XX:SurvivorRatio=5 -XX:TargetSurvivorRatio=90 -XX:MaxTenuringThreshold=15 -XX:CMSInitiatingOccupancyFraction=90 \
-XX:MaxDirectMemorySize=256M -XX:+UseParNewGC -XX:+CMSParallelRemarkEnabled -XX:+UseConcMarkSweepGC \
-Djava.nio.channels.spi.SelectorProvider=sun.nio.ch.EPollSelectorProvider -Dsun.net.inetaddr.ttl=60 \
-Dorg.mortbay.jetty.Request.maxFormContentSize=-1 -Djetty.home=/opt/jetty-6 -Djava.io.tmpdir=/tmp \
-jar /opt/jetty-6/start.jar /opt/jetty-6/etc/jetty-logging.xml /opt/jetty-6/etc/jetty.xml