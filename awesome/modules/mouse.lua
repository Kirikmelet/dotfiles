-- mouse.lua
-- Handles mouse input

local gears = require("gears")
local awful = require("awful")
local menuopts = require("modules.menu")
local M = {}


M = gears.table.join(
   awful.button({ }, 3, function () menuopts.mainmenuopts:toggle() end),
   awful.button({ }, 4, awful.tag.viewnext),
   awful.button({ }, 5, awful.tag.viewprev)
)

root.buttons(M)
