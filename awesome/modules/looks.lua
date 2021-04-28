-- Looks module
-- Handles theming
local bt = require("beautiful")
local gear = require("gears")

-- Init looks
bt.init(gear.filesystem.get_configuration_dir() .. "/themes/default/theme.lua")
