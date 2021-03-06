---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by kute.
--- DateTime: 2019/12/22 10:16
---
local json_util = require("util.json_util")
local response = {}

response.code_message = {
    ["OK"] = {
        ["code"] = 200,
        ["message"] = "success"
    },
    ["BAD_REQUEST"] = {
        ["code"] = 400,
        ["message"] = "Bad Request"
    },
    ["UNAUTHORIZED"] = {
        ["code"] = 401,
        ["message"] = "Unauthorized"
    },
    ["FORBIDDEN"] = {
        ["code"] = 403,
        ["message"] = "Forbidden"
    },
    ["NOT_FOUND"] = {
        ["code"] = 404,
        ["message"] = "Not Found"
    },
    ["NOT_FOUND_CLIENT_IP"] = {
        ["code"] = 404001,
        ["message"] = "Not Found Client IP"
    },
    ["METHOD_NOT_ALLOWED"] = {
        ["code"] = 405,
        ["message"] = "Method Not Allowed"
    },
    ["NOT_ACCEPTABLE"] = {
        ["code"] = 406,
        ["message"] = "Not Acceptable"
    },
    ["PROXY_AUTHENTICATION_REQUIRED"] = {
        ["code"] = 407,
        ["message"] = "Proxy Authentication Required"
    },
    ["REQUEST_TIMEOUT"] = {
        ["code"] = 408,
        ["message"] = "Request Timeout"
    },
    ["CONFLICT"] = {
        ["code"] = 409,
        ["message"] = "Conflict"
    },
    ["GONE"] = {
        ["code"] = 410,
        ["message"] = "Gone"
    },
    ["LENGTH_REQUIRED"] = {
        ["code"] = 411,
        ["message"] = "Length Required"
    },
    ["PRECONDITION_FAILED"] = {
        ["code"] = 412,
        ["message"] = "Precondition Failed"
    },
    ["REQUEST_TOO_LONG"] = {
        ["code"] = 413,
        ["message"] = "Request Entity Too Large"
    },
    ["REQUEST_URI_TOO_LONG"] = {
        ["code"] = 414,
        ["message"] = "Request-URI Too Long"
    },
    ["UNSUPPORTED_MEDIA_TYPE"] = {
        ["code"] = 415,
        ["message"] = "Unsupported Media Type"
    },
    ["REQUESTED_RANGE_NOT_SATISFIABLE"] = {
        ["code"] = 416,
        ["message"] = "Requested Range Not Satisfiable"
    },
    ["EXPECTATION_FAILED"] = {
        ["code"] = 417,
        ["message"] = "Expectation Failed"
    },
    ["INSUFFICIENT_SPACE_ON_RESOURCE"] = {
        ["code"] = 419,
        ["message"] = "Proxy Reauthentication Required"
    },
    ["METHOD_FAILURE"] = {
        ["code"] = 420,
        ["message"] = "Method Failure"
    },
    ["UNPROCESSABLE_ENTITY"] = {
        ["code"] = 422,
        ["message"] = "Unprocessable Entity"
    },
    ["LOCKED"] = {
        ["code"] = 423,
        ["message"] = "Locked"
    },
    ["FAILED_DEPENDENCY"] = {
        ["code"] = 424,
        ["message"] = "Failed Dependency"
    },
    ["INTERNAL_SERVER_ERROR"] = {
        ["code"] = 500,
        ["message"] = "Server Error"
    },
    ["NOT_IMPLEMENTED"] = {
        ["code"] = 501,
        ["message"] = "Not Implemented"
    },
    ["BAD_GATEWAY"] = {
        ["code"] = 502,
        ["message"] = "Bad Gateway"
    },
    ["SERVICE_UNAVAILABLE"] = {
        ["code"] = 503,
        ["message"] = "Service Unavailable"
    },
    ["GATEWAY_TIMEOUT"] = {
        ["code"] = 504,
        ["message"] = "Gateway Timeout"
    },
    ["HTTP_VERSION_NOT_SUPPORTED"] = {
        ["code"] = 505,
        ["message"] = "HTTP Version Not Supported"
    },
    ["INSUFFICIENT_STORAGE"] = {
        ["code"] = 507,
        ["message"] = "Insufficient Storage"
    },
    ["ILLEGAL_FORMAT_PARAM"] = {
        ["code"] = 40001,
        ["message"] = "Parameter Format Invalid"
    }
}

function response:exit(code_message)
    if code_message ~= nil then
        self.res = code_message
    end
    ngx.say(json_util.encode(self.res))
    ngx.exit(ngx.HTTP_OK)
end

function response:new()
    local instance = {
        ["_version"] = "0.1",
        ["res"] = {}
    }
    setmetatable(instance, { __index = self })
    return instance
end

return response