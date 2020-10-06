local gears = require('gears')
local awful = require('awful')
local beautiful = require('beautiful')
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
local M = {}



M.keys = {

   modkey = 'Mod4'
}


-- Appkey for AwesomeWM
M.appslist = {
   terminal = {exec = 'alacritty'};
   editor = {exec = os.getenv('EDITOR') or 'nvim', term = true};
   fileman = {exec = 'nnn', term = true};
   browser = {exec = 'firefox'};
   netman = {exec = 'nmtui', term = true};
   music = {exec = 'ncmpcpp', term = true};
   sysrec = {exec = 'htop', term = true};
}

for _,x in pairs(M.appslist) do
   if x.term then
      x.exec = M.appslist.terminal.exec..' -e '..x.exec
   end
end

return M
