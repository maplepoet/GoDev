# Dockerfile
# 构建 Docker 镜像 docker build -t your-image-name .
# 运行 Docker 容器 docker run -d --name your-container-name -p 8080:8080 your-image-name
# -d: 以后台运行容器。
# --name your-container-name: 为容器指定一个名称。
# -p 8080:8080: 将容器的端口映射到主机的端口。


# 使用 golang 镜像作为基础镜像
FROM golang:latest

# 设置工作目录
WORKDIR /app

# 将本地的 go.mod 和 go.sum 文件复制到容器中
COPY go.mod .
COPY go.sum .

# 下载依赖
RUN go mod download

# 将本地的所有文件复制到容器中
COPY . .

# 构建 Go 项目
RUN go build -o main .

# 设置容器启动时执行的命令
CMD ["./main"]
