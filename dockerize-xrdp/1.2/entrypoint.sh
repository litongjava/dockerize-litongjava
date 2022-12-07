#!/bin/bash
#如果/home/.created文件存在,执行
if [ ! -f /home/.created ];then
#创建用户,设置密码
if [ -e $USER ];then
  export USER=user
fi
echo "  User: $USER"

if [ -e $PASSWORD ];then
  export PASSWORD=user
fi
echo "  Password: $PASSWORD"

useradd -m $USER
echo "$USER:$PASSWORD"|chpasswd
gpasswd -a $USER wheel

#设置桌面环境
cat <<EOF > /home/$USER/.Xclients
fcitx -r
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XIM=fcitx
exec xfce4-session
EOF

chmod +x /home/$USER/.Xclients
cp /home/$USER/.Xclients root/
chmod +x /root/.Xclients
#创建文件确保下次系统不会执行
touch /home/.created
fi 

#启动supervisord
if [ -e "$1" ];then
  exec "$@"
else
  exec /usr/bin/supervisord -n -c /etc/supervisord.conf
fi
