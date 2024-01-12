# Makefile

# 运行 make build 构建 Docker 镜像。
# 运行 make push 将构建好的 Docker 镜像上传到容器注册表。

# 项目名称
PROJECT_NAME := my-golang-app

# Docker 镜像仓库地址
REGISTRY := your-container-registry.com

# Docker 镜像名称
IMAGE_NAME := $(REGISTRY)/$(PROJECT_NAME)

# Docker 构建相关参数
DOCKER_BUILD_FLAGS := --rm -t $(IMAGE_NAME)

# 默认目标，构建并上传 Docker 镜像
.PHONY: all
all: build push

# 构建 Docker 镜像
.PHONY: build
build:
	docker build $(DOCKER_BUILD_FLAGS) .

# 上传 Docker 镜像
.PHONY: push
push:
	docker push $(IMAGE_NAME)
