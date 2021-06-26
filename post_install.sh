#!/bin/sh

VERSION=6.2.4

echo "creating users"
pw adduser redis

echo "creating the folder structure"
mkdir -p /usr/local/redis

echo "downloading redis version $VERSION"
cd /tmp/
fetch https://download.redis.io/releases/redis-$VERSION.tar.gz
tar -xzvf redis-$VERSION.tar.gz

cd redis-$VERSION

echo "building redis"
gmake

echo "installing the executables"
cp src/redis-server src/redis-cli src/redis-benchmark src/redis-sentinel /usr/local/redis/

echo "updating folder permissions"
chown -R redis:nogroup /usr/local/redis

echo "enabling the services"
sysrc redis_enable=YES

echo "setting the service user"
sysrc redis_user=redis

echo "starting the service"
service start

cat /PLUGIN_INFO
