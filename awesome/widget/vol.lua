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
   time = 10;
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
      timeout = 1;
      call_now = true;
      autostart = true;
      callback = function()
         self:get_vol()
         self.widget:set_text(' VOL: '..self.vol)
      end
})
   self.widget:connect_signal('mouse::enter', function() self:hover() end)
end

function M:hover()
   self.popup = awful.tooltip({objects = {self.widget}})
   self:get_vol()
   self.popup.text = "Volume at "..self.vol
end

function M:get_vol()
   local i = io.popen("amixer sget Master | awk -F '[][]' '{ print $2 }' | sed '/^[[:space:]]*$/d'", 'r')
   self.vol = i:read()
   i:close()
end

return M
