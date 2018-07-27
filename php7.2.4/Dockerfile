FROM alpine:3.7

ENV TIMEZONE Asia/Shanghai
ENV PHP_VERSION 7.2.4
ENV PROTOBUF_VERSION 3.6.0
ENV REDIS_VERSION 4.1.0
ENV SWOOLE_VERSION 4.0.3
ENV YAC_VERSION 2.0.2
ENV GRPC_VERSION 1.13.0

LABEL Maintainer="millken <millken@gmail.com>" \
      Description="Lightweight php 7.2 container based on alpine with Composer installed and swoole installed." 

COPY tmp/ /tmp/

RUN cd /tmp/ \
	&& ([ -f /tmp/php-${PHP_VERSION}.tar.xz ] || wget http://hk2.php.net/distributions/php-${PHP_VERSION}.tar.xz) \
	&& tar xf php-${PHP_VERSION}.tar.xz \
    && ([ -f /tmp/swoole-${SWOOLE_VERSION}.tgz ] || wget http://pecl.php.net/get/swoole-${SWOOLE_VERSION}.tgz) \
	&& tar xf swoole-${SWOOLE_VERSION}.tgz \
    && ([ -f /tmp/protobuf-${PROTOBUF_VERSION}.tgz ] || wget http://pecl.php.net/get/protobuf-${PROTOBUF_VERSION}.tgz) \
	&& tar xf protobuf-${PROTOBUF_VERSION}.tgz \
    && ([ -f /tmp/yac-${YAC_VERSION}.tgz ] || wget http://pecl.php.net/get/yac-${YAC_VERSION}.tgz) \
	&& tar xf yac-${YAC_VERSION}.tgz \
    && ([ -f /tmp/redis-${REDIS_VERSION}.tgz ] || wget http://pecl.php.net/get/redis-${REDIS_VERSION}.tgz) \
	&& tar xf redis-${REDIS_VERSION}.tgz \
    && ([ -f /tmp/grpc-${GRPC_VERSION}.tgz ] || wget http://pecl.php.net/get/grpc-${GRPC_VERSION}.tgz) \
	&& tar xf grpc-${GRPC_VERSION}.tgz \
	&& sed -i 's/dl-cdn.alpinelinux.org/mirrors.shu.edu.cn/g' /etc/apk/repositories \
  	&& apk update \
	&& apk add --no-cache --virtual build-dependencies git mysql-client curl openssh-client libffi-dev postgresql-dev hiredis-dev zlib-dev icu-dev libxml2-dev freetype-dev libpng-dev libjpeg-turbo-dev g++ make autoconf \
    && cd /tmp/php-${PHP_VERSION} \
    && ./configure --enable-inline-optimization --enable-static=yes --prefix=/usr/local --with-config-file-path=/etc --without-pear --disable-cgi --disable-opcache --enable-fpm --disable-all --enable-posix  --enable-sysvshm --enable-sysvsem --enable-sigchild --enable-inline-optimization --enable-mbstring --with-iconv --with-pdo-mysql -with-pgsql=/usr/local/pgsql --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-zlib-dir=/usr/include/ --with-openssl --enable-pdo --enable-session --enable-tokenizer --enable-hash --enable-fileinfo --enable-json --enable-shared=no --disable-debug --disable-short-tags --disable-ipv6 --disable-rpath --disable-fileinfo \
    && make && make install

RUN apk del build-dependencies \
    && rm -rf /tmp/* 

RUN mkdir /var/www

WORKDIR /var/www

VOLUME ["/var/www"]


CMD ["/bin/sh"]
