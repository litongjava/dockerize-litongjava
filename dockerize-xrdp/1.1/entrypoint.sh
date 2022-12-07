#!/bin/bash
#创建用户,设置密码
if [ -e $USER ];then
  export USER=user
fi
echo "User: $USER"

if [ -e $PASSWORD ];then
  export PASSWORD=user
fi
echo "Password: $PASSWORD"

useradd -m $USER
echo "$USER:$PASSWORD"|chpasswd
gpasswd -a $USER wheel

#设置桌面环境
cat <<EOF > /home/$USER/.Xclients
ibus-daemon -drx
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
exec xfce4-session
EOF

chmod +x /home/$USER/.Xclients
cp /home/$USER/.Xclients root/
chmod +x /root/.Xclients

#启动supervisord
if [ -e "$1" ];then
  exec "$@"
else
  exec /usr/bin/supervisord -n -c /etc/supervisord.conf
fi
