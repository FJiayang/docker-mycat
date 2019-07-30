FROM openjdk:8u212-jre-alpine
MAINTAINER fjy8018 fjy8018@gmail.com

# Mycat 版本
ENV MYCAT_VERSION 1.6.6.1
ENV MYCAT_PKG Mycat-server-"$MYCAT_VERSION"-release-20181031195535-linux.tar.gz

WORKDIR /
# 缓存层
RUN wget http://dl.mycat.io/$MYCAT_VERSION/$MYCAT_PKG
RUN tar -zxf /$MYCAT_PKG && \
    rm -rf /$MYCAT_PKG && \
    chmod -R 777 /mycat && \
    chmod +x /mycat/bin/*

# 配置文件目录 日志文件目录
VOLUME ["/mycat/conf","/mycat/logs"]

#ENTRYPOINT ["/mycat/bin/mycat","console"]
ENTRYPOINT ["/mycat/bin/startup_nowrap.sh"]

# 端口
EXPOSE 8066 9066