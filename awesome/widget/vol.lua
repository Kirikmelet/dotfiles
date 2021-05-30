local awful = require('awful')
local watch = require('awful.widget.watch')
local naughty = require('naughty')
local gears = require("gears")
local wibox = require("wibox")
local M = {}

local settings = {
   dev = 'Master';
   name = '音量';
   cmd = "amixer sget Master | awk -F '[][]' '{ print $2 }' | sed '/^[[:space:]]*$/d'";
   altcmd = 'pamixer --get-volume';
   time = 1;
   usealt = true;
}

local name_widget = wibox.widget(
   {
         widget = wibox.widget.textbox
   }
)

local bat_widget = wibox.widget(
   {
      widget = wibox.widget.textbox
   }
)


function M:init()
   name_widget:set_text(string.format(' %s: ', settings.name))
   self.widget = wibox.widget{
      name_widget,
      bat_widget,
      layout = wibox.layout.fixed.horizontal}
   self:timer()
   return self.widget
end

function M:timer()
   gears.timer({
      timeout = settings.time;
      autostart = true;
      call_now = true;
      callback = function()
         self:get_vol()
         bat_widget:set_text(self.vol)
      end
   })
end

function M:get_vol()
   local i = nil
   if settings.usealt then
      i = io.popen(settings.altcmd, 'r')
   else
      i = io.popen(settings.cmd, 'r')
   end
   self.vol = i:read()
   while self.vol == nil or self.vol == '' do
      self.vol = i:read()
   end
   i:close()
   if not self.vol:find('%%') then
      self.vol = self.vol..'%'
   end
end

return M
