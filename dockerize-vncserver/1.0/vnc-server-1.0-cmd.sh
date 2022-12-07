#!/bin/sh
if [ -e $VNC_PASSWORD ];then
  export VNC_PASSWORD=00000000
fi
#判断文件是否存在,如果不存则是第一次启动
if [ ! -f /home/.created ];then
  #如果文件不存在,设置vnc密码
  echo "第一次启动设置vnc密码是$VNC_PASSWORD"
  sh -c "yes $VNC_PASSWORD | vncpasswd"
  touch /home/.created
fi
echo "启动vnc server"
vncserver :1 -geometry 1920x1080 -depth 24
echo "启动sshd"
/usr/sbin/sshd -D