# Mycat Docker Image

MyCat 版本：`1.6-RELEASE`

镜像版本号：`1.6`

基础镜像：`openjdk:8-jre`

配置文件挂载路径：`/mycat/conf`

对外端口：`8066`，管理端口`9066`

## 如何使用

### 1. 拷贝配置文件

运行临时容器，生成配置文件

```bash
$ docker run --rm -d --name=mycat fjy8018/mycat:1.6
```

`/usr/mycat/conf` 是宿主机配置文件目录

```bash
$ docker cp mycat:/usr/local/mycat/conf /usr/mycat
```

停止临时容器

```bash
$ docker stop mycat
```

### 2. 挂载配置启动

挂载配置启动命令

```bash
$ docker run --name=mycat -p 3306:8066 -p 9066:9066 \
    -v /usr/mycat/conf:/usr/local/mycat/conf \
    fjy8018/mycat:1.6
```

停止命令

```bash
$ docker stop mycat && docker rm mycat
```

## 更小的镜像

镜像版本号：`1.6-apline`

另外使用`apline`环境构建了更小的镜像

基础镜像：`openjdk:8u212-jre-alpine`

运行临时容器，生成配置文件

```bash
$ docker run --rm -d --name=mycat fjy8018/mycat:1.6-apline
```