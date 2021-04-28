-- menu.lua
-- Handles Menu
local awful = require("awful")
local vars = require("modules.vars")
local menubar = require("menubar")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local M = {}

-- Set terminal
menubar.utils.terminal = vars.appslist.terminal

local awesomemenu = {
   {'hotkeys', function () hotkeys_popup.show_help(nil, awful.screen.focused()) end};
   {'manual', vars.appslist.terminal.exec..' -e man awesome'};
   {'restart', awesome.restart};
   {'quit', function() awesome.quit() end};
}


local powermenu = {
   {"Power", function() awful.spawn(vars.appslist.terminal.exec .. "-e 'doas poweroff'") end};
   {"Restart", function() awful.spawn(vars.appslist.terminal.exec .. "-e 'doas reboot'") end}
}

M.mainmenuopts = awful.menu({
      items = {
         {"Awesome", awesomemenu, beautiful.awesome_icon};
         {"Power Menu", powermenu};
      }
})

M.launcher = awful.widget.launcher({
      image = beautiful.awesome_icon,
      menu = M.mainmenuopts
})

return M
