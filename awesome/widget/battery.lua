local awful = require('awful')
local naughty = require('naughty')
local gears = require("gears")
local wibox = require("wibox")
local M = {}
local err = {}

function M:settings()
   -- Change settings here
   self.set = {
      bat = 'BAT1';
      time = 1;
   }
end

function err:call(val)
   if not val then return nil end
   naughty.notify({
      title='DEBUG';
      text=val
})
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
   if not i then return err:call('Failed to read') end
   self.percent = i:read()
   i:close()
   local x = io.open('/sys/class/power_supply/'..self.set.bat..'/status', 'r')
   if not x then return err:call('Failed to read') end
   self.status = x:read()
   x:close()
end

function M:hover()
   self.popup = awful.tooltip({objects = {self.widget}})
   self:getbat()
   self.popup.text = 'The battery is at '..self.percent..'%\nAnd is currently '..self.status..'.'
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
   self.widget:connect_signal('mouse::enter', function() self:hover() end)
end

return M
