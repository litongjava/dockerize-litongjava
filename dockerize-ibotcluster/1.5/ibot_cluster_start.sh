#!/bin/sh
#重新加载/etc/ld.so.conf配置文件
ldconfig
#启动mysql
/etc/init.d/mysqld start
#启动robot
/usr/local/ibotcluster/robot/jetty.sh start
#启动manager
/usr/java/jdk1.6.0_45/bin/java -Xmn1024M -Xms2048M -Xmx2048M -XX:MaxPermSize=512M -Xconcurrentio -Dh2db.port=9100 \
-XX:SurvivorRatio=5 -XX:TargetSurvivorRatio=90 -XX:MaxTenuringThreshold=31 -XX:CMSInitiatingOccupancyFraction=90 \
-XX:MaxDirectMemorySize=256M -XX:+UseParNewGC -XX:+CMSParallelRemarkEnabled -XX:+UseConcMarkSweepGC \
-Djava.nio.channels.spi.SelectorProvider=sun.nio.ch.EPollSelectorProvider -Dsun.net.inetaddr.ttl=60 \
-Dibot.mgr.auth.captchaEnable=false -Dxss.all.enable=true  -Denable_csrf_token=true \
-Dorg.mortbay.jetty.Request.maxFormContentSize=-1 -Djetty.home=/usr/local/ibotcluster/manager -Djava.io.tmpdir=/tmp \
-jar /usr/local/ibotcluster/manager/start.jar /usr/local/ibotcluster/manager/etc/jetty-logging.xml /usr/local/ibotcluster/manager/etc/jetty.xml