# Makefile

# 运行 make build 构建 Docker 镜像。
# 运行 make push 将构建好的 Docker 镜像上传到容器注册表。

# 项目名称
PROJECT_NAME := godev

# Docker 镜像仓库地址
REGISTRY := maplepoet

# Docker 镜像名称
DOCKER_IMAGE_NAME := $(REGISTRY)/$(PROJECT_NAME)
DOCKER_IMAGE_TAG := latest
DOCKER_USERNAME := maplepoet
DOCKER_PASSWORD := Shanyang0711


# Docker 构建相关参数
DOCKER_BUILD_FLAGS := --rm -t $(DOCKER_IMAGE_NAME)

# 默认目标，构建并上传 Docker 镜像
.PHONY: all build push clean
all: build push

# 构建 Docker 镜像
.PHONY: build
build:
	docker build $(DOCKER_BUILD_FLAGS):$(DOCKER_IMAGE_TAG) .

# 上传 Docker 镜像
.PHONY: push
push:
	docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD)
	docker push $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)

# Target to remove the local Docker image
.PHONY: clean
clean:
	docker rmi $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)