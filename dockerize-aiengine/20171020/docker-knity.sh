#!/bin/sh
#docker ai-enine 启动脚本

##########################
# custom variables start
###########################
JAVA_HOME=/usr/java/jdk1.6.0_45/
JAVA=$JAVA_HOME/bin/java
JAVA_OPTS="-Xmn256M -Xms3000M -Xmx3000M -Xss256k -XX:MaxPermSize=128M -XX:MaxDirectMemorySize=256M -server -XX:+UseParallelGC -XX:+UseParallelOldGC -XX:MinHeapFreeRatio=10 -XX:MaxHeapFreeRatio=90 -XX:MaxGCPauseMillis=100 -XX:+UseAdaptiveSizePolicy -Djava.nio.channels.spi.SelectorProvider=sun.nio.ch.EPollSelectorProvider -Dsun.net.inetaddr.ttl=60 -Dfile.encoding=GBK -Duser.language=zh -Dknity.home=/usr/local/ai-engine8/app"
APP_HOME=/usr/local/ai-engine8
CLASSPATH=$APP_HOME/conf:$APP_HOME/app
for file in $APP_HOME/lib/*.jar;
	do CLASSPATH=$CLASSPATH:$file;
done
#启动引擎
$JAVA $JAVA_OPTS -classpath $CLASSPATH com.incesoft.knity.Knity
