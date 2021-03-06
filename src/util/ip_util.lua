---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by kute.
--- DateTime: 2019/11/25 19:44
---

local _M = {}
local ip_util = _M

-- 获取客户端IP
function _M.get_client_ip()
    ip = ngx.req.get_headers()["X-Real-IP"]
    if not ip then
        ip = ngx.req.get_headers()["x_forwarded_for"]
    end
    if not ip then
        ip  = ngx.var.remote_addr
    end
    if not ip then
        ip  = "unknown"
    end
    return ip
end

return ip_util