# Mycat Docker Image

版本：`1.6.6.1`

基础镜像：`openjdk:8-jre`

配置文件挂载路径：`/mycat/conf`

对外端口：`8066`，管理端口`9066`

启动命令

```bash
$ docker run --name=mycat -p 3306:8066 -p 9066:9066 \
    -v /usr/mycat/conf:/mycat/conf \
    -v /usr/mycat/logs:/mycat/logs \
    fjy8018/mycat:1.6.6.1
```

停止命令
```bash
$ docker stop mycat && docker rm mycat
```