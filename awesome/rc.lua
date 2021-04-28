pcall(require, "luarocks.loader")

--local gears = require("gears")
local awful = require("awful")
--local wibox = require("wibox")
--local beautiful = require("beautiful")
--local naughty = require("naughty")
require("awful.autofocus")

-- Use LuaJIT
-- pcall(function() jit.on() end)

require("modules.error") -- I don't think this works
--require("modules.autostart")
require("modules.looks")
require("modules.desktop")
require("modules.rules")
require("modules.signal")
require("modules.mouse")
require("modules.keybind")


