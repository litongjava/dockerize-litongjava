## build
```
docker build -t litongjava/postgres:16.3 .
```

## 搭建Postgresql主从复制集群
target: 一主和一从

### 主从部署准备
先pull容器，并运行，这里我是将密码设置为123456，你可以自定义
```
docker run -d -p 5432:5432 --name postgresql -e POSTGRES_PASSWORD=123456 litongjava/postgres:16.3
```
创建挂载目录
```
rm -rf /docker_data/postgres/master
rm -rf /docker_data/postgres/slave
mkdir /docker_data/postgres/master -p
mkdir /docker_data/postgres/slave -p
```

为防止数据随容器被删除而丢失，这里将数据复制到主机的/docker_data/postgres下，并准备了两套环境，准备做主从容器的挂载目录
```
docker cp postgresql:/var/lib/postgresql/data /docker_data/postgres/master/
docker cp postgresql:/var/lib/postgresql/data /docker_data/postgres/slave/
```
停止并删除该容器，准备启动主从
```
docker stop postgresql
docker rm postgresql
```
### 主库
启动主库
```
docker run -d -p 15432:5432 --name pgmaster \
-e PGDATA=/var/lib/postgresql/data \
-e POSTGRES_PASSWORD=123456 \
-v /docker_data/postgres/master/data:/var/lib/postgresql/data \
litongjava/postgres:16.3
```
create user
```
docker exec -it pgmaster bash   # 进入pgmaster容器
psql -U postgres                # postgres用户 执行psql
```
创建用户 syscuser 密码为123456 用于主从同步
```
create role replica login replication encrypted password '123456';
```

主库配置文件 
```
vi /docker_data/postgres/master/data/pg_hba.conf
```
在最后一行加入以下配置
```
host    replication     replica        172.17.0.1/32           trust
```
注意，这里的172.17.0.1是容器的网关IP，这里也可以写容器的IP，不过docker容器的IP可能每次启动都不一样，这里单机版的主从配置推荐这样配置，如果是多台服务器的主从，这里的IP需要配置成从节点的IP

or
```
host    replication     all        all           trust
```

修改/docker_data/postgres/master/data/postgresql.conf
```
listen_addresses = '*'   #监听所有IP
archive_mode = on      #允许归档
archive_command = '/bin/date'    #用该命令来归档logfile segment,这里取消归档。
wal_level = replica    #开启热备
max_wal_senders = 100    #流复制连接数量,从库的max_wal_senders必须大于此值
wal_keep_size = 1024    #设置wal的大小，单位M。
wal_sender_timeout = 60s #设置流复制主机发送数据的超时时间
max_connections = 100    #最大连接数据库,从库的max_connections必须大于此值
```
重启容器

docker restart pgmaster

### 从库
启动从库
```
docker run -d -p 25432:5432 --name pgslave \
-e PGDATA=/var/lib/postgresql/data \
-e POSTGRES_PASSWORD=123456 \
-v /docker_data/postgres/slave/data:/var/lib/postgresql/data  \
litongjava/postgres:16.3
```

从库
进入从库容器，删除自身数据，同步主节点数据
```
docker exec -it pgslave bash
cd /var/lib/postgresql/data/
rm -rf *
pg_basebackup -h 172.17.0.1 -p 15432 -U replica -Fp -Xs -Pv -R -D /var/lib/postgresql/data
```
笔者对新增了下面的支持pg_basebackup和启动postgres一气呵成
执行之前需要先清楚数据
```
rm -rf /docker_data/postgres/slave/data
```
```
docker run -d -p 25432:5432 --name pgslave \
-e PGDATA=/var/lib/postgresql/data \
-e POSTGRES_PASSWORD=123456 \
-e PG_MASTER_HOST=172.17.0.1 \
-e PG_MASTER_PORT=15432 \
-e PG_MASTER_USER=replica \
-e PG_MASTER_PASSWORD=123456 \
-e USE_BASEBACKUP=1 \
-v /docker_data/postgres/slave/data:/var/lib/postgresql/data  \
litongjava/postgres:16.3
```
查看权限
```
ls -l /docker_data/postgres/slave/data
```
新增并配置standby.signal文件

vi /docker_data/postgres/slave/data/standby.signal
内容为
```
standby_mode = 'on'
```
修改
```
vi /docker_data/postgres/slave/data/postgresql.conf
```
```
wal_level = replica   # WAL 日志级别为 replica
primary_conninfo = 'host=172.17.0.1 port=15432 user=replica password=123456'   # 主库连接信息	
hot_standby = on                     # 恢复期间，允许查询
recovery_target_timeline = latest    # 默认
max_connections = 120                # 大于等于主节点，正式环境应当重新考虑此值的大小
max_wal_senders = 100    #流复制连接数量,从库的max_wal_senders必须大于此值
```
重启从库
```
docker restart pgslave
```
### 验证
重启服务
```
docker restart pgmaster pgslave
```
验证主从是否正常
主库上执行以下命令，可以看到从库信息
```
docker exec -it pgmaster psql -U postgres
```

```
select client_addr,sync_state from pg_stat_replication;
```

```
create table port_area(
  id              char(32) primary key,
  name            char(255),
  channel_node_id char(32),
  time            char(32),
  is_del          CHAR(1) default 0,
  create_date     DATE,
  create_by       char(32)
);
```
```
SELECT * FROM pg_tables WHERE schemaname = 'public';
```

docker exec -it pgslave psql -U postgres
```
SELECT * FROM pg_tables WHERE schemaname = 'public';
```