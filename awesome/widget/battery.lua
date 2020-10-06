
local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local naughty = require("naughty")
local M = {}
local err = {}

function M:settings()
   -- Change settings here
   self.set = {
      bat = 'BAT1';
      time = 10;
   }
end

function err:call(val)
   if not val then return nil end
end



function M:init()
   -- Initialize Widget
   self:settings()
   self:getbat()
   self.widget = wibox.widget(
      {text = '', widget = wibox.widget.textbox()}
   )
   self:timer()

   return self.widget
end

function M:getbat()
   -- Get battery percentage
   local i = io.open('/sys/class/power_supply/'..self.set.bat..'/capacity', 'r')
   if not i then return nil end
   self.percent = i:read()
   i:close()
end

function M:timer()
   -- Set timer
   gears.timer{
      timeout = self.set.time;
      call_now = true;
      autostart = true;
      callback = function()
         self:getbat()
         self.widget:set_text('BAT: '..self.percent..'%')
      end
   }
end

return M
