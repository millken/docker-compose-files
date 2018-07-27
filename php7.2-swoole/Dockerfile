FROM php:7.2.4-fpm-alpine

ENV TIMEZONE Asia/Shanghai
ENV PROTOBUF_VERSION 3.6.0
ENV REDIS_VERSION 4.1.0
ENV SWOOLE_VERSION 4.0.3
ENV YAC_VERSION 2.0.2
ENV GRPC_VERSION 1.13.0

LABEL Maintainer="millken <millken@gmail.com>" \
      Description="Lightweight php 7.2 container based on alpine with Composer installed and swoole pecl installed." 

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.shu.edu.cn/g' /etc/apk/repositories \
  	&& apk update \
    && apk add --no-cache  icu libpng freetype libjpeg-turbo hiredis libpq \
    && apk add --no-cache --virtual build-dependencies git mysql-client curl openssh-client libffi-dev postgresql-dev hiredis-dev zlib-dev icu-dev libxml2-dev freetype-dev libpng-dev libjpeg-turbo-dev g++ make autoconf \
    && docker-php-source extract \
	&& cd /tmp/ \
	&& wget http://pecl.php.net/get/swoole-${SWOOLE_VERSION}.tgz && tar xf swoole-${SWOOLE_VERSION}.tgz \
	&& docker-php-ext-configure /tmp/swoole-${SWOOLE_VERSION} --enable-async-redis --enable-openssl --enable-sockets=/usr/local/include/php/ext/sockets \
	&& docker-php-ext-install /tmp/swoole-${SWOOLE_VERSION} \
	&& wget http://pecl.php.net/get/redis-${REDIS_VERSION}.tgz && tar xf redis-${REDIS_VERSION}.tgz \
	&& docker-php-ext-configure /tmp/redis-${REDIS_VERSION} \
	&& docker-php-ext-install /tmp/redis-${REDIS_VERSION} \
	&& wget http://pecl.php.net/get/protobuf-${PROTOBUF_VERSION}.tgz && tar xf protobuf-${PROTOBUF_VERSION}.tgz \
	&& docker-php-ext-configure /tmp/protobuf-${PROTOBUF_VERSION} \
	&& docker-php-ext-install /tmp/protobuf-${PROTOBUF_VERSION} \
	&& wget http://pecl.php.net/get/yac-${YAC_VERSION}.tgz && tar xf yac-${YAC_VERSION}.tgz \
	&& docker-php-ext-configure /tmp/yac-${YAC_VERSION} \
	&& docker-php-ext-install /tmp/yac-${YAC_VERSION} \
	&& wget http://pecl.php.net/get/grpc-${GRPC_VERSION}.tgz && tar xf grpc-${GRPC_VERSION}.tgz \
	&& docker-php-ext-configure /tmp/grpc-${GRPC_VERSION} \
	&& docker-php-ext-install /tmp/grpc-${GRPC_VERSION} \	
	&& echo "yac.enable_cli = 1" >> /usr/local/etc/php/conf.d/docker-php-ext-yac.ini \
    && docker-php-source delete \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install pgsql pdo_mysql pdo_pgsql intl zip gd \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && cd  / && rm -fr /usr/src \
    && apk del build-dependencies \
    && rm -rf /tmp/* \
	&& rm -rf /var/cache/apk/* \
	&& echo "log_errors = On" >> /usr/local/etc/php/conf.d/docker-vars.ini \
    && echo "error_log = /dev/stderr" >> /usr/local/etc/php/conf.d/docker-vars.ini

RUN 
WORKDIR /var/www

VOLUME ["/var/www"]

EXPOSE 9000 

CMD ["php-fpm"]
