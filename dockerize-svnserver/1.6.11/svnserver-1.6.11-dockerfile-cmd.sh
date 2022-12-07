#!/bin/sh
#如果文件夹不存在,创建文件夹和仓库
if [ ! -e /opt/svn/repository/conf ];then
  echo "仓库不不存在,创建仓库"
  mkdir -p /opt/svn/repository && svnadmin create /opt/svn/repository
else
  echo "仓库存在"
fi
#启动服务
echo "启动svn server"
/usr/bin/svnserve -d -r /opt/svn/repository --foreground