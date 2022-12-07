#!/bin/sh
echo "开始启动tomcat"
/usr/lib/jvm/jre/bin/java \
-classpath :/usr/share/tomcat/bin/bootstrap.jar:/usr/share/tomcat/bin/tomcat-juli.jar:\
/usr/share/java/commons-daemon.jar \
-Dcatalina.base=/usr/share/tomcat -Dcatalina.home=/usr/share/tomcat \
-Djava.endorsed.dirs= -Djava.io.tmpdir=/var/cache/tomcat/temp \
-Djava.util.logging.config.file=/usr/share/tomcat/conf/logging.properties \
-Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager org.apache.catalina.startup.Bootstrap start