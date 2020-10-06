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

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
   awful.layout.suit.tile,
   awful.layout.suit.tile.left,
   awful.layout.suit.tile.bottom,
   awful.layout.suit.tile.top,
   --awful.layout.suit.fair,
   --awful.layout.suit.fair.horizontal,
   awful.layout.suit.spiral,
   --awful.layout.suit.spiral.dwindle,
   --awful.layout.suit.max,
   --awful.layout.suit.max.fullscreen,
   --awful.layout.suit.magnifier,
   --awful.layout.suit.corner.nw,
   -- awful.layout.suit.corner.ne,
   -- awful.layout.suit.corner.sw,
   -- awful.layout.suit.corner.se,
   awful.layout.suit.floating,
}
