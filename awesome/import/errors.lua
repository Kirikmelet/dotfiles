local gears = require('gears')
local awful = require('awful')
local beautiful = require('beautiful')
local hkp = require('awful.hotkeys_popup')
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
local menuopts = require('import/menu')
local keyer = require('import/keybind')
local M = {}

-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
   naughty.notify({ preset = naughty.config.presets.critical,
   title = "ERROR! CONFIG ERROR (USING FALLBACK)",
   text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
   local in_error = false
   awesome.connect_signal("debug::error", function (err)
      -- Make sure we don't go into an endless error loop
      if in_error then return end
      in_error = true

      naughty.notify({ preset = naughty.config.presets.critical,
      title = "ERROR! CONFIG ERROR (RUNTIME)",
      text = tostring(err) })
      in_error = false
   end)
end
