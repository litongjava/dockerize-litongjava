build
```
docker build -t litongjava/tio-boot-builder:graalvm-jdk-21.0.3-stable-slim .
```
push
```
docker push litongjava/tio-boot-builder:graalvm-jdk-21.0.3-stable-slim
```

run
```
docker run --rm --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro litongjava/tio-boot-builder:graalvm-jdk-21.0.3-stable-slim
```
```
docker run -dit --net=host --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro litongjava/tio-boot-builder:graalvm-jdk-21.0.3-stable-slim /bin/sh
```
```
docker run -dit --net=host --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro litongjava/tio-boot-builder:graalvm-jdk-21.0.3-stable-slim /llm-proxy/target/llm-proxy
```

or
```
docker run --rm --net=host --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro litongjava/tio-boot-builder:graalvm-jdk-21.0.3-stable-slim /llm-proxy/target/llm-proxy
```

测试失败
```
docker run -dit --net=host --privileged litongjava/tio-boot-builder:graalvm-jdk-21.0.3-stable-slim /bin/sh
```