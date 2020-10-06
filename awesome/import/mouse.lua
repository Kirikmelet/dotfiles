local gears = require('gears')
local awful = require('awful')
local beautiful = require('beautiful')
local hkp = require('awful.hotkeys_popup')
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
local menuopts = require('import/menu')
local M = {}

M.mousebuttons = gears.table.join(
   awful.button({ }, 3, function () menuopts.mainmenuopts:toggle() end),
   awful.button({ }, 4, awful.tag.viewnext),
   awful.button({ }, 5, awful.tag.viewprev)
   )

return M
