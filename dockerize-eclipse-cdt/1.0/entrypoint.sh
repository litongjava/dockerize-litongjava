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

#创建桌面启动方式
mkdir -p /home/$USER/Desktop
mkdir -p /root/Desktop/

cat <<EOF > /home/$USER/Desktop/eclipse-cdt.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=eclipse-cdt
Comment=
Exec=/opt/eclipse-cpp/eclipse
Icon=/opt/eclipse-cpp/icon.xpm
Path=
Terminal=false
StartupNotify=false
EOF

chmod u+x /home/$USER/Desktop/eclipse-cdt.desktop
cp /home/$USER/Desktop/eclipse-cdt.desktop /root/Desktop/

#设置权限
chown $USER:$USER -R /home/$USER

#创建文件确保下次系统不会执行
touch /home/.created

fi 
  
#启动supervisord
if [ -e "$1" ];then
  exec "$@"
else
  exec /usr/bin/supervisord -n -c /etc/supervisord.conf
fi