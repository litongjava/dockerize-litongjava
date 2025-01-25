# Use the offical Golang image to build the app: https://hub.docker.com/_/golang
FROM golang:1.22.1

# Copy code to the image
WORKDIR /src

RUN apt-get update && apt-get install -y --no-install-recommends git && apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/litongjava/go-llm-proxy.git && cd go-llm-proxy && CGO_ENABLED=0 GOOS=linux go build -v -o /app main.go

CMD ["/app"]
