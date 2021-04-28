-- bar.lua
-- Handles bar

local gears = require('gears')
local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local naughty = require("naughty")
--local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
local vars = require('modules.vars')
local menulaunch = require('modules.menu')
local M = {}

local testwid = require('widget.battery')
local volwid = require('widget.vol')


local clock = wibox.widget.textclock()

-- {{{Declare tag buttons

local tag_buts = gears.table.join(
   awful.button({ }, 1, function(t) t:view_only() end),
   awful.button({ modkey }, 1, function(t)
         if client.focus then
            client.focus:move_to_tag(t)
         end
   end),
   awful.button({ }, 3, awful.tag.viewtoggle),
   awful.button({ modkey }, 3, function(t)
         if client.focus then
            client.focus:toggle_tag(t)
         end
   end),
   awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
   awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

-- }}}

-- {{{Declare task buttons

local task_buts = gears.table.join(
   awful.button({ }, 1, function (c)
         if c == client.focus then
            c.minimized = true
         else
            c:emit_signal(
               "request::activate",
               "tasklist",
               {raise = true}
            )
         end
   end),
   awful.button({ }, 3, function()
         awful.menu.client_list({ theme = { width = 250 } })
   end),
   awful.button({ }, 4, function ()
         awful.client.focus.byidx(1)
   end),
   awful.button({ }, 5, function ()
         awful.client.focus.byidx(-1)
   end)
)

--}}}

-- {{{Wallpaper function
local function wall_set(s)
   if beautiful.wallpaper then
      local wall = beautiful.wallpaper
      if type(wall) == 'function' then
         wall = wal(s)
      end
      gears.wallpaper.maximized(wall, s, true)
   end
end
-- }}}

--{{{Signal & Bar
screen.connect_signal('property::geometry', wall_set)

awful.screen.connect_for_each_screen(function(s)
      
      -- Set wallpaper
      wall_set(s)
      
      -- Tag Table
      awful.tag({'1', '2', '3', '4', '5', '6', '7', '8', '9'}, s, awful.layout.layouts[1])
      
      -- Promptbox for every screen
      s.promptbox = awful.widget.prompt()
      
      --Layout box per screen
      s.layoutbox = awful.widget.layoutbox(s)
      s.layoutbox:buttons(gears.table.join(
                             awful.button({ }, 1, function() awful.layout.inc(1) end),
                             awful.button({ }, 3, function() awful.layout.inc(-1) end),
                             awful.button({ }, 4, function() awful.layout.inc(1) end),
                             awful.button({ }, 5, function() awful.layout.inc(-1) end)
      ))
      
      -- Taglist widget
      s.taglist = awful.widget.taglist {
         screen = s;
         filter = awful.widget.taglist.filter.all;
         buttons = tag_buts;
      }
      
      -- Tasklist widget
      s.tasklist = awful.widget.tasklist {
         screen = s;
         filter = awful.widget.tasklist.filter.currenttags;
         buttons = task_buts
      }
      
      -- Create the WeebBox
      s.wibox = awful.wibar({position = 'top', screen = s})
      
      s.wibox:setup{
         layout = wibox.layout.align.horizontal,
         { -- Das Linke
            layout = wibox.layout.fixed.horizontal;
            --menulaunch.launcher;
            s.taglist;
            s.promptbox;
         },
         -- Midbar
         s.tasklist;
   { -- The Right
      layout = wibox.layout.fixed.horizontal;
      wibox.widget.systray();
      testwid:init();
      volwid:init({});
      clock;
      --s.layoutbox;
   },
      }
end)

