```
docker build -t litongjava/dockerize-navicat-tunnel:1.0.0 -f Dockerfile.txt .
```

```
docker run -dit --restart=always --name navicat-tunnel -p 5433:80 litongjava/dockerize-navicat-tunnel:1.0.0
```