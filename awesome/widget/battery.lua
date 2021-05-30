local awful = require('awful')
local naughty = require('naughty')
local gears = require("gears")
local wibox = require("wibox")
local M = {}

local settings = {
   bat = 'BAT1',
   time = '1'
}

local text_wid = wibox.widget(
   {
      widget = wibox.widget.textbox
   }
)

local name_wid = wibox.widget(
   {
      widget = wibox.widget.textbox
   }
)


function M:init()
   -- Initialize Widget

   name_wid:set_text(string.format(' %s: ', '電池'))
   self.widget = wibox.widget{
      name_wid,
      text_wid,
      layout  = wibox.layout.fixed.horizontal
   }
   self:timer()
   return self.widget
end

function M:getbat()
   -- Get battery percentage
   local i = io.open('/sys/class/power_supply/'..settings.bat..'/capacity', 'r')
   local x = io.open('/sys/class/power_supply/'..settings.bat..'/status', 'r')
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


function M:timer()
   -- Set timer
   gears.timer{
      timeout = settings.time;
      call_now = true;
      autostart = true;
      callback = function()
         self:getbat()
         text_wid:set_text(self.percent..'%')
      end
   }
end

return M
