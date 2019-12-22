server{
  listen 8080;
  server_name light.kute.com *.kute.com;

  access_log /opt/openresty/nginx/logs/light.kute.com_access.log main;
  error_log /opt/openresty/nginx/logs/light.kute.com_error.log  error;

  location /light {
        default_type text/html;
        content_by_lua '
          require("lapis").serve("app")
        ';
  }

  location ~ ^/api/light/message/unreadcount$ {
      access_by_lua_file /opt/openresty/lualib/api/access_by_ip.lua;
      default_type text/html;
      content_by_lua_block {
          ngx.say("HelloWorlda")
      }
  }

  location ~ ^/api/light/message/unreadcount2$ {
      default_type text/html;
      content_by_lua_file /opt/openresty/lualib/work/get_read_count.lua;
  }
}