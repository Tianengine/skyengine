local version = setmetatable({
  major = 0,
  minor = 12,
  patch = 3,
  --suffix = ""
}, {
  __tostring = function(t)
    return string.format("%d.%d.%d%s", t.major, t.minor, t.patch,
                         t.suffix and t.suffix or "")
  end
})

return {
  -- modify by tfkj mrzeta
  -- 1.modify meta.lua 
  -- default value
  -- _NAME = "kong",
  -- modify value
  -- _NAME = "SkyEngine",
  -- 2.modify nginx_kong.lua 
  -- add line 
  -- server {
  --     server_name kong;
  --     listen ${{PROXY_LISTEN}}${{PROXY_PROTOCOL}};
  --     return 301 https://$host$request_uri;
  -- }
  -- 3.modify kong.config.default
  -- add to env KONG_SERVER_TOKENS off
  -- 4.modify constants.lua
  -- default value
  -- PROXY_LATENCY = "X-Kong-Proxy-Latency",
  -- UPSTREAM_LATENCY = "X-Kong-Upstream-Latency",
  -- modify value
  -- PROXY_LATENCY = "X-Skyengine-Proxy-Latency",
  -- UPSTREAM_LATENCY = "X-Skyengine-Upstream-Latency",
  _NAME = "SkyEngine",
  _VERSION = tostring(version),
  _VERSION_TABLE = version,

  -- third-party dependencies' required version, as they would be specified
  -- to lua-version's `set()` in the form {from, to}
  _DEPENDENCIES = {
    nginx = {"1.11.2.5", "1.13.6.1"},
  }
}
