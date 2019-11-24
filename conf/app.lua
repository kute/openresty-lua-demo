---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by kute.
--- DateTime: 2019/11/21 12:15
---

local lapis = require("lapis")
local config = require("lapis.config").get()
local app = lapis.Application()

app:get("/light", function()
    return "Welcome to Lapis " .. require("lapis.version")
end)

-- performance log
if config.measure_performance then
    local after_dispatch = require("lapis.nginx.context").after_dispatch
    local to_json = require("lapis.util").to_json
    app:before_filter(function(self)
        after_dispatch(function()
            print(to_json(ngx.ctx.performance))
        end)
    end)
end

-- url matched must start with '/light'

-- 嵌套url
app:match("/light/api/test/:name/count", function(self)
    ngx.log(ngx.ERR, "/api/test/:name/count name=", self.params.name)
end)

-- 默认路由，所有未匹配的请求将会被处理
function app:default_route()
    ngx.log(ngx.NOTICE, "User hit unknown path " .. self.req.parsed_url.path)
    -- 调用 默认路由 的默认实现，见 demo
    return lapis.Application.default_route(self)
end
-- 重写 404
function app:handle_404()
    return { status = 404, layout = false, "Not Found!" }
end

-- 异常处理
-- config.custom_error_page is made up for this example
function app:handle_error(err, trace)
    if config.custom_error_page then
        return { render = "my_custom_error_page" }
    else
        return lapis.Application.handle_error(self, err, trace)
    end
end



return app