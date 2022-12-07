#!/bin/sh
#FRONT_CONSOLE_CONTEXT_PATH eg http://www.xxx.com/front-console
echo $FRONT_CONSOLE_CONTEXT_PATH
#测试成功
sed -i.ori 's#front.console.root.path=http://stla.demo.uairobot.com/front-console#front.console.root.path='$FRONT_CONSOLE_CONTEXT_PATH'#' $FRONT_CONSOLE_CONFIG_PROPERTIES
#default var __baseURI = "http://stla.demo.uairobot.com/front-console", __logout = "http://stla.demo.uairobot.com/front-console/logout.action";
sed -i.ori 's#http://stla.demo.uairobot.com/front-console#'$FRONT_CONSOLE_CONTEXT_PATH'#' $IFRAMRBASE_JS
#创建日志保存目录
mkdir -p /opt/log/front-console/
echo "entrypont end"

echo "开始启动mysql"
/etc/init.d/mysqld start
echo "开始启动tomcat"
/usr/lib/jvm/jre/bin/java \
-classpath :/usr/share/tomcat/bin/bootstrap.jar:/usr/share/tomcat/bin/tomcat-juli.jar:\
/usr/share/java/commons-daemon.jar \
-Dcatalina.base=/usr/share/tomcat -Dcatalina.home=/usr/share/tomcat \
-Djava.endorsed.dirs= -Djava.io.tmpdir=/var/cache/tomcat/temp \
-Djava.util.logging.config.file=/usr/share/tomcat/conf/logging.properties \
-Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager org.apache.catalina.startup.Bootstrap start
