## docker-run-eclipse-cdt-1.0

#### 启动容器和连接容器

##### 启动容器

| docker run -dit --name=eclipse-cdt -p 20022:22 -p 23389:3389 -p 25901:5901 -e USER=litong -e PASSWORD=00000000 \\ -v /dv/eclipse/eclipse-workspace:/home/litong/eclipse-workspace litongjava/eclipse-cdt:1.0 |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

或者

| docker run -dit --name=eclipse-cdt -p 10022:22 -p 13389:3389 -e USER=litong -e PASSWORD=00000000 \\ litongjava/eclipse-cdt:1.0 |
|--------------------------------------------------------------------------------------------------------------------------------|

##### 连接容器

ssh连接容器

使用任意ssh客户端连接容器

xrdp连接容器

在windows上执行下面的命令登录容器

| mstsc -v ip:23389 |
|-------------------|

在没有连接容器之前,容器上开启了3389和3350,连接容器之后,容器就开启了5910端口

第一次登录会提示选择面板,选择 Use default config

![](media/260ffb74e947a43cad38eb8989ea4cbe.png)

vnc连接容器

启动容器内的tigervncserver

容器默认并没有启动tigervncserver服务需要手动启动,启动命令如下

| vncserver :1 -geometry 1920x1080 -depth 24 |
|--------------------------------------------|

启动vncserver之后,就可以使用任意vnc客户端连接容器

#### 使用容器

##### 使用中文搜狗输入法

登录成功后执行fcitx-configtool--\>Input Method选择+号, 取消only show current
language选择sougou pinyin 添加

![](media/73ae7f0a2ba9ad3639e5758114794c1d.png)

单击右上角键盘,选择sougou pinyin

![](media/94716a7e33f1efb0d78d70ed1d62df42.png)

按Ctrl+Space进行中英文输入法切换

##### 创建C Hello World

![](media/4ed483c89f14af2696d76ffdb19a9746.png)

选工作空间

![](media/2937e54acda7b2a1b128511ad86b8795.png)

Eclipse启动成功

![](media/b98c5d23cb8deb92104c5bb635a059f0.png)

创建C项目

File--\>New--\>Other--\> C Project

![](media/649a400bad656ac4ef888d97173994ca.png)

选择工具链为LInux GCC,选择Project Type为Hello World ANSI Project

![](media/c62c000c78d14a934daaeb5fb3d27e3f.png)

先点击工具栏锤子形状的按钮进行编译

![IMG_256](media/fea6de63b49eb3b0a7e21cdb5619d1fd.png)

点击工具栏运行按钮,选择 Local C/C++ Application

![IMG_256](media/6662a6e46585d3d6ef7715b529122215.png)

会出现项目的界面,不用做任何更改,直接选择run

![](media/d124aa593bb0bceba4fb08afe90b6b20.png)

运行成功

![](media/3f9ca5a6658a858ab797f4e5db2e1277.png)

退出时一定要先关闭eclipse并注销,不要直接点
远程桌面连接工具的x,否则再次启动eclipse时会出现项目的问题

![](media/3a22b67bee0cd4f00edcaf4580df98c5.png)

![](media/9f38ae458803a896e2b99617c6555ce1.png)
