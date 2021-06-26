# iocage-redis-plugin
Plugin for easily running an instance of Redis in TrueNAS

## Installation

```
fetch https://raw.githubusercontent.com/kennedyoliveira/iocage-redis-plugin/master/redis-manifest.json
iocage fetch --plugins redis-manifest ip4_addr="interface|IPaddress"
```

## Defaults

Database location: `/usr/local/redis/data`
Configuration location: `/usr/local/redis/redis.conf`
