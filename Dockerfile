FROM openjdk:8u212-jre-alpine
MAINTAINER fjy8018 fjy8018@gmail.com

# Mycat 版本
ENV MYCAT_VERSION 1.6-RELEASE
ENV MYCAT_PKG Mycat-server-1.6-RELEASE-20161028204710-linux.tar.gz

WORKDIR /usr/local

# 缓存层
RUN wget http://dl.mycat.io/$MYCAT_VERSION/$MYCAT_PKG
RUN apk update && \
    apk add --no-cache procps && \
    apk --no-cache add ca-certificates wget && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk && \
    apk add glibc-2.29-r0.apk && \
    rm -rf *.apk && \
    tar -zxf /usr/local/$MYCAT_PKG && \
    rm -rf /usr/local/$MYCAT_PKG

VOLUME /usr/local/mycat/conf

EXPOSE 8066 9066

ENTRYPOINT /usr/local/mycat/bin/mycat console