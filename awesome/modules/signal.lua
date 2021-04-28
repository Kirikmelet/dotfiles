-- signal.lua
-- Handles signals by AwesomeWM

local wibox = require("wibox")
local beautiful = require("beautiful")
local awful = require("awful")
local gears = require("gears")

client.connect_signal("manage", function (c)
                         if awesome.startup
                            and not c.size_hints.user_position
                            and not c.size_hints.program_position then
                            awful.placement.no_offscreen(c)
                         end
end)

client.connect_signal("request::titlebars", function (c)
                         local button = gears.table.join(
                            awful.button({ }, 1, function ()
                                  c:emit_signal("request::activate", "titlebar", {raise = true})
                                  awful.mouse.client.move(c)
                            end),
                            awful.button({ }, 3, function ()
                                  c:emit_signal("request::activate", "titlebar", {raise = true})
                                  awful.mouse.client.resize(c)
                            end)
                         )
                         awful.titlebar(c) : setup{
                            { -- Left
                               awful.titlebar.widget.iconwidget(c);
                               awful.titlebar.widget.closebutton(c);
                               buttons = button;
                               layout = wibox.layout.fixed.horizontal
                            },
                            { -- Middle
                               { -- Title
                                  align = "left";
                                  widget = awful.titlebar.widget.titlewidget(c)
                               },
                               buttons = button;
                               layout = wibox.layout.flex.horizontal
                            },
                            { -- Right
                               awful.titlebar.widget.maximizedbutton(c);
                               awful.titlebar.widget.ontopbutton(c);
                               layout = wibox.layout.fixed.horizontal()
                            },
                            layout = wibox.layout.align.horizontal
                            }
end)

-- Enable sloppy focus
client.connect_signal("mouse::enter", function (c)
                         c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

