buidl
```
docker build -t litongjava/postgres:15 .
```

```
docker run -d -p 5433:5432 \
  --name postgres-slave \
  --restart on-failure \
  --shm-size 128mb \
  -e PGDATA=/var/lib/postgresql/data \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e PG_MASTER_HOST=192.168.3.9 \
  -e PG_MASTER_PORT=5432 \
  -e PG_MASTER_USER=replica \
  -e PG_MASTER_PASSWORD=replica \
  -e USE_BASEBACKUP=1 \
  -v $(pwd)/postgre_slave/data:/var/lib/postgresql/data \
  --health-cmd "pg_isready -q -d postgres -U postgres" \
  --health-interval 5s \
  --health-timeout 5s \
  --health-retries 5 \
  litongjava/postgres:15
```

设置为从模式
```
vi data/standby.signal
```
```
standby_mode = 'on'
```

```
primary_conninfo = 'host=192.168.3.9 port=5432 user=replica password=replica'
```