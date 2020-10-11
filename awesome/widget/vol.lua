local awful = require('awful')
local watch = require('awful.widget.watch')
local naughty = require('naughty')
local gears = require("gears")
local wibox = require("wibox")
local M = {}

function M:settings()
   self.set = {
      dev = 'Master';
      cmd = "amixer sget Master | awk -F '[][]' '{ print $2 }' | sed '/^[[:space:]]*$/d'";
      altcmd = 'amixer sget Master';
      time = 1;
   }
end


function M:init()
   self:settings()

   self.widget = wibox.widget({
      widget = wibox.widget.textbox;
   })

   self:timer()

   return self.widget
end


function M:timer()
   gears.timer({
      timeout = self.set.time;
      autostart = true;
      call_now = true;
      callback = function()
         self:get_vol()
         self.widget:set_text(' VOL: '..self.vol..' ')
      end
   })
end

function M:get_vol()
   local i = io.popen("amixer sget Master | awk -F '[][]' '{ print $2 }' | sed '/^[[:space:]]*$/d'", 'r')
   self.vol = i:read()
   i:close()
end

return M
