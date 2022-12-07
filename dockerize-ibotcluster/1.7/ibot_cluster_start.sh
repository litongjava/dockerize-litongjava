#!/bin/sh
#重新加载/etc/ld.so.conf配置文件
ldconfig
#启动mysql
/etc/init.d/mysqld start
#启动robot
/opt/ibot_cluster/robot/robot.sh start
#启动manager
/opt/ibot_cluster/jdk1.6.0_45/bin/java -Xmn1024M -Xms2048M -Xmx2048M -XX:MaxPermSize=512M -Xconcurrentio -Dh2db.port=9100 \
-XX:SurvivorRatio=5 -XX:TargetSurvivorRatio=90 -XX:MaxTenuringThreshold=31 -XX:CMSInitiatingOccupancyFraction=90 \
-XX:MaxDirectMemorySize=256M -XX:+UseParNewGC -XX:+CMSParallelRemarkEnabled -XX:+UseConcMarkSweepGC \
-Djava.nio.channels.spi.SelectorProvider=sun.nio.ch.EPollSelectorProvider -Dsun.net.inetaddr.ttl=60 \
-Dibot.mgr.auth.captchaEnable=false -Denable_csrf_token=true \
-Dorg.mortbay.jetty.Request.maxFormContentSize=-1 -Djetty.home=/opt/ibot_cluster/manager -Djava.io.tmpdir=/tmp \
-jar /opt/ibot_cluster/manager/start.jar /opt/ibot_cluster/manager/etc/jetty-logging.xml /opt/ibot_cluster/manager/etc/jetty.xml