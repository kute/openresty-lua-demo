
# openresty-lua-lapis

#
- https://leafo.net/lapis/reference.html
- https://github.com/Tinywan/lua-nginx-redis
- https://github.com/openresty/lua-resty-redis
- https://github.com/openresty/lua-nginx-module
- https://github.com/anjia0532/lua-resty-redis-util
- https://luarocks.org/
- https://github.com/steve0511/resty-redis-cluster
- https://moonbingbing.gitbooks.io/openresty-best-practices/content/index.html

#### 1、ngx.log_level

- ngx.STDERR     -- 标准输出
- ngx.EMERG      -- 紧急报错
- ngx.ALERT      -- 报警
- ngx.CRIT       -- 严重，系统故障，触发运维告警系统
- ngx.ERR        -- 错误，业务不可恢复性错误
- ngx.WARN       -- 告警，业务中可忽略错误
- ngx.NOTICE     -- 提醒，业务比较重要信息
- ngx.INFO       -- 信息，业务琐碎日志信息，包含不同情况判断等
- ngx.DEBUG      -- 调试

#### 2、init install

1、安装lua

```
$ curl -R -O  http://www.lua.org/ftp/lua-5.1.5.tar.gz
$ tar zxf lua-5.1.5.tar.gz
$ cd lua-5.1.5
$ make linux test
$ make install
```
mac
```
$ brew update
$ curl -R -O  http://www.lua.org/ftp/lua-5.1.5.tar.gz
$ tar zxf lua-5.1.5.tar.gz
$ cd lua-5.1.5
$ make macosx
$ make install
```

2、安装luarocks

```
$ wget https://luarocks.org/releases/luarocks-3.2.0.tar.gz
$ tar zxpf luarocks-3.2.0.tar.gz
$ cd luarocks-3.2.0
$ ./configure; 
$ make && make install
$ luarocks install luasocket
$ luarocks install lua-cjson
$ luarocks install luafilesystem
$ luarocks install md5
$ luarocks install lua-resty-redis-cluster # https://github.com/steve0511/resty-redis-cluster
```

3、安装git

```
yum install git
```


4、安装依赖

```
yum install readline-devel pcre-devel openssl-devel perl
```

5、安装 lapis

```
luarocks install lapis
```

6、安装openresty

```
$ wget https://openresty.org/download/openresty-1.15.8.2.tar.gz
$ tar zxpf openresty-1.15.8.2.tar.gz
$ cd openresty-1.15.8.2
$ ./configure --prefix=/opt/openresty --with-luajit --with-http_random_index_module --with-http_gzip_static_module --with-http_stub_status_module --with-http_realip_module --with-http_ssl_module --with-http_iconv_module
$ gmake && gmake install
```
```
nginx // 启动
nginx -s reload
nginx -s stop
nginx -t
```

7、lapis初始化
```
lapis new --lua // 在当前文件夹初始化lapis
lapis server dev LAPIS_OPENRESTY=/opt/openresty  // 启动
lapis term dev LAPIS_OPENRESTY=/opt/openresty // 停止服务
lapis build dev LAPIS_OPENRESTY=/opt/openresty  // 重新加载配置文件
```

http://light.kute.com:8080/light
http://light.kute.com:8080/light/api/test/name/count
http://light.kute.com:8080/api/light/message/unreadcount
