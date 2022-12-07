#!/bin/sh
#启动mysql
/etc/init.d/mysqld start
#重新加载/etc/ld.so.conf配置文件
ldconfig
##替换文件开始
[ ! -z ${FRONTEND_URL} ] && sed -i 's#context.path=http://pubcloud.xiaoi.com/#context.path='${FRONTEND_URL}'#' $FRONTEND_APP_PROPERTIES
[ ! -z ${ROBOT_ROOT_URL} ] && sed -i 's#robotdemo.addr=http://222.73.110.107:80#'robotdemo.addr=${ROBOT_ROOT_URL}'#' $FRONTEND_APP_PROPERTIES
[ ! -z ${AI_ADDR} ] && sed -i 's#ai.cqbank.addr=127.0.0.1:9000#ai.cqbank.addr='${AI_ADDR}'#' $FRONTEND_APP_PROPERTIES
[ ! -z ${PROJECT_ID} ] && sed -i 's#cqbank#'${PROJECT_ID}'#' $FRONTEND_APP_PROPERTIES
[ ! -z ${ROBOT_MYSQL_IP_PORT} ] && sed -i 's#jdbc:mysql://127.0.0.1/ibot_app#jdbc:mysql://'${ROBOT_MYSQL_IP_PORT}'#' $FRONTEND_APP_PROPERTIES
[ ! -z ${ROBOT_MYSQL_USER} ] && sed -i 's#jdbc.ask.username=root#jdbc.ask.username='${ROBOT_MYSQL_USER}'#' $FRONTEND_APP_PROPERTIES
[ ! -z ${ROBOT_MYSQL_PASSWORD} ] && sed -i 's#jdbc.ask.password=root#jdbc.ask.password='${ROBOT_MYSQL_PASSWORD}'#' $FRONTEND_APP_PROPERTIES
#mongodb
[ ! -z ${MONGODB_NAME} ] && sed -i 's#mongodb.name=cloud#mongodb.name='${MONGODB_NAME}'#' $FRONTEND_APP_PROPERTIES
[ ! -z ${MONGODB_IP} ] && sed -i 's#mongodb.url=127.0.0.1#mongodb.url='${MONGODB_IP}'#' $FRONTEND_APP_PROPERTIES
[ ! -z ${MONGODB_PORT} ] && sed -i 's#mongodb.port=27017#mongodb.port='${MONGODB_PORT}'#' $FRONTEND_APP_PROPERTIES
[ ! -z ${MONGODB_USERHAME} ] && sed -i 's#mongodb.username=admin#mongodb.username='${MONGODB_USERNAME}'#' $FRONTEND_APP_PROPERTIES
[ ! -z ${MONGODB_PASSWORD} ] && sed -i 's#mongodb.password=admin#mongodb.password='${MONGODB_PASSWORD}'#' $FRONTEND_APP_PROPERTIES
#redis
[ ! -z ${REDIS_IP} ] && sed -i 's#host=100.100.100.100#host='${REDIS_IP}'#' $FRONTEND_REDIS_PROPERTIES
[ ! -z ${REDIS_PORT} ] && sed -i 's#port=6379#port='${REDIS_PORT}'#' $FRONTEND_REDIS_PROPERTIES
#notify.properties
[ ! -z ${ROBOT_ROOT_URL} ] && sed -i 's#http://100.100.100.100:110#'${ROBOT_ROOT_URL}'#' $FRONTEND_NOTIFY_PROPERTIES

[ ! -z ${BACKEND_URL} ] && sed -i 's#context.path=http://127.0.0.1/backend/#context.path='${BACKEND_URL}'#' $BACKEND_APP_PROPERTIES
[ ! -z ${FRONTEND_URL} ] && sed -i 's#cloud.addr=http://pubcloud.xiaoi.com/#cloud.addr='${FRONTEND_URL}'#' $BACKEND_APP_PROPERTIES
[ ! -z ${ROBOT_ROOT_URL} ] && sed -i 's#robotdemo.addr=http://222.73.110.107:80#robotdemo.addr='${ROBOT_ROOT_URL}'#' $BACKEND_APP_PROPERTIES
[ ! -z ${AI_ADDR} ] && sed -i 's#ai.cqbank.addr=127.0.0.1:9000#ai.cqbank.addr='${AI_ADDR}'#' $BACKEND_APP_PROPERTIES
[ ! -z ${AI_ADDR} ] && sed -i 's#ai.addr=127.0.0.1:9000#ai.addr='${AI_ADDR}'#' $BACKEND_APP_PROPERTIES
[ ! -z ${PROJECT_ID} ] && sed -i 's#cqbank#'${PROJECT_ID}'#' $BACKEND_APP_PROPERTIES
[ ! -z ${ROBOT_MYSQL_IP_PORT} ] && sed -i 's#jdbc:mysql://127.0.0.1/ibot_app#jdbc:mysql://'${ROBOT_MYSQL_IP_PORT}'#' $BACKEND_APP_PROPERTIES
[ ! -z ${ROBOT_MYSQL_USER} ] && sed -i 's#jdbc.ask.username=root#jdbc.ask.username='${ROBOT_MYSQL_USER}'#' $BACKEND_APP_PROPERTIES
[ ! -z ${ROBOT_MYSQL_PASSWORD} ] && sed -i 's#jdbc.ask.password=root#jdbc.ask.password='${ROBOT_MYSQL_PASSWORD}'#' $BACKEND_APP_PROPERTIES
#mongodb
[ ! -z ${MONGODB_NAME} ] && sed -i 's#mongodb.name=cloud#mongodb.name='${MONGODB_NAME}'#' $FRONTEND_APP_PROPERTIES
[ ! -z ${MONGODB_IP} ] && sed -i 's#mongodb.url=127.0.0.1#mongodb.url='${MONGODB_IP}'#' $FRONTEND_APP_PROPERTIES
[ ! -z ${MONGODB_PORT} ] && sed -i 's#mongodb.port=27017#mongodb.port='${MONGODB_PORT}'#' $FRONTEND_APP_PROPERTIES
[ ! -z ${MONGODB_USERHAME} ] && sed -i 's#mongodb.username=admin#mongodb.username='${MONGODB_USERNAME}'#' $FRONTEND_APP_PROPERTIES
[ ! -z ${MONGODB_PASSWORD} ] && sed -i 's#mongodb.password=admin#mongodb.password='${MONGODB_PASSWORD}'#' $FRONTEND_APP_PROPERTIES
#redis
[ ! -z ${REDIS_IP} ] && sed -i 's#host=127.0.0.1#host='${REDIS_IP}'#' $BACKEND_REDIS_PROPERTIES
[ ! -z ${REDIS_PORT} ] && sed -i 's#port=6379#port='${REDIS_PORT}'#' $BACKEND_REDIS_PROPERTIES
#notify.properties
[ ! -z ${ROBOT_ROOT_URL} ] && sed -i 's#http://127.0.0.1#'${ROBOT_ROOT_URL}'#' $BACKEND_NOTIFY_PROPERTIES
#web.xml
[ ! -z ${FRONT_CONSOLE_URL} ] && sed -i 's#http://intcloud.xiaoi.com/front-console#'${FRONT_CONSOLE_URL}'#' $BACKEND_WEB_XML
[ ! -z ${BACKEND_URL} ] && sed -i 's#http://222.73.110.106/backend#'${BACKEND_URL}'#' $BACKEND_WEB_XML
#启动jetty
/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.41.x86_64/jre/bin/java -Xmn1024M -Xms2048M -Xmx2048M -XX:MaxPermSize=512M \
-Xconcurrentio -XX:SurvivorRatio=5 -XX:TargetSurvivorRatio=90 -XX:MaxTenuringThreshold=31 -XX:CMSInitiatingOccupancyFraction=90 \
-XX:MaxDirectMemorySize=256M -XX:+UseParNewGC -XX:+CMSParallelRemarkEnabled -XX:+UseConcMarkSweepGC \
-Djava.nio.channels.spi.SelectorProvider=sun.nio.ch.EPollSelectorProvider -Dsun.net.inetaddr.ttl=60 \
-Dorg.mortbay.jetty.Request.maxFormContentSize=-1 -Djetty.home=/opt/jetty-6 -Djava.io.tmpdir=/tmp \
-jar /opt/jetty-6/start.jar /opt/jetty-6/etc/jetty-logging.xml /opt/jetty-6/etc/jetty.xml