-- desktop.lua
-- Handles desktop quirks

local awful = require("awful")

awful.layout.layouts = {
   awful.layout.suit.tile;
   awful.layout.suit.spiral;
   awful.layout.suit.floating;
}

