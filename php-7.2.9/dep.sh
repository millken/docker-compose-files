#!/bin/bash
export PHP_VERSION="7.2.9"
export PROTOBUF_VERSION="3.6.1"
export REDIS_VERSION="4.1.1"
export SWOOLE_VERSION="4.1.2"
export YAC_VERSION="2.0.2"
[ -d tmp ] || mkdir tmp;
cd tmp;
[ -f php-${PHP_VERSION}.tar.xz ] || wget http://hk2.php.net/distributions/php-${PHP_VERSION}.tar.xz;
[ -f swoole-${SWOOLE_VERSION}.tgz ] || wget http://pecl.php.net/get/swoole-${SWOOLE_VERSION}.tgz
[ -f protobuf-${PROTOBUF_VERSION}.tgz ] || wget http://pecl.php.net/get/protobuf-${PROTOBUF_VERSION}.tgz
[ -f redis-${REDIS_VERSION}.tgz ] || wget http://pecl.php.net/get/redis-${REDIS_VERSION}.tgz
[ -f yac-${YAC_VERSION}.tgz ] || wget http://pecl.php.net/get/yac-${YAC_VERSION}.tgz;
