local awful = require('awful')
local naughty = require('naughty')
local gears = require("gears")
local wibox = require("wibox")
local M = {}

function M:settings()
   -- Change settings here
   self.set = {
      bat = 'BAT1';
      time = 1;
   }
end



function M:init()
   -- Initialize Widget
   self:settings()

   self.wid = {}

   self.icon_wid = wibox.widget {
      {
         id = "icon",
         widget = wibox.widget.imagebox,
         resize = false
      },
      layout = wibox.container.margin(_, 0, 0, 3)
   }

   self.text_wid= wibox.widget(
   {widget = wibox.widget.textbox()}
   )

   self.widget = wibox.widget{
      self.icon_wid,
      self.text_wid,
      layout  = wibox.layout.fixed.horizontal
   }

   self.icon_wid.widget:set_image('/usr/share/icons/Papirus-Dark/symbolic/status/battery-missing-symbolic.svg')

   self:timer()

   return self.widget
end

function M:getbat()
   -- Get battery percentage
   local i = io.open('/sys/class/power_supply/'..self.set.bat..'/capacity', 'r')
   local x = io.open('/sys/class/power_supply/'..self.set.bat..'/status', 'r')
   self.percent = i:read()
   self.status = x:read()
   i:close()
   x:close()

   if tonumber(self.percent) <= 25 then
      naughty.notify({
         preset = naughty.config.presets.critical;
         title = 'LOW BATTERY';
         text = 'BATTERY AT '..self.percent..'!\nCHARGE IMMEDIATELLY!'
      })
   end
end

function M:setbat()
end

function M:timer()
   -- Set timer
   gears.timer{
      timeout = self.set.time;
      call_now = true;
      autostart = true;
      callback = function()
         self:getbat()
         self.text_wid:set_text(' BAT: '..self.percent..'% ')
      end
   }
end

return M
