-- keybind.lua
-- Handles keybinds

local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")
local vars = require("modules.vars")
local menu = require("modules.menu")
local bars = require("modules.bar")
local M = {}

local modkey = vars.keys.modkey


-- {{{Keyboard
M.globalkeys = gears.table.join(
   -- Help Key
   awful.key({ modkey,           }, '/',      hotkeys_popup.show_help,
      {description='show help', group='awesome'}),
   
   -- Go to left tag
   awful.key({ modkey,           }, 'Left',   awful.tag.viewprev,
      {description = 'view previous', group = 'tag'}),
   
   -- Go to right tag
   awful.key({ modkey,           }, 'Right',  awful.tag.viewnext,
      {description = 'view next', group = 'tag'}),
   
   -- Go back tag
   awful.key({ modkey,           }, 'Escape', awful.tag.history.restore,
      {description = 'go back', group = 'tag'}),
   
   -- Go to next task
   awful.key({ modkey,           }, 'j',
      function ()
         awful.client.focus.byidx( 1)
      end,
      {description = 'focus next by index', group = 'client'}
   ),
   
   -- Go to pevious task
   awful.key({ modkey,           }, 'k',
      function ()
         awful.client.focus.byidx(-1)
      end,
      {description = 'focus previous by index', group = 'client'}
   ),
   
   -- Show menu
   awful.key({ modkey,           }, 'w', function () menu.mainmenuopts:show() end,
      {description = 'show main menu', group = 'awesome'}),
   
   -- Media Keys
   awful.key({}, 'XF86AudioLowerVolume', function ()
         awful.util.spawn('amixer sset Master 5%-',false)
   end),
   awful.key({}, 'XF86AudioRaiseVolume', function ()
         awful.util.spawn('amixer sset Master 5%+',false)
   end),
   awful.key({}, 'XF86AudioMute', function ()
         awful.util.spawn('amixer sset Master toggle',false)
   end),
   awful.key({}, 'XF86MonBrightnessDown', function ()
         awful.util.spawn('brightnessctl s 15-',false)
   end),
   awful.key({}, 'XF86MonBrightnessUp', function ()
         awful.util.spawn('brightnessctl s 15+',false)
   end),
   
   -- Layout manipulation
   
   -- Swap pos with next client
   awful.key({ modkey, 'Shift'   }, 'j', function () awful.client.swap.byidx(  1)    end,
      {description = 'swap with next client by index', group = 'client'}),
   
   -- Swap pos with prev client
   awful.key({ modkey, 'Shift'   }, 'k', function () awful.client.swap.byidx( -1)    end,
      {description = 'swap with previous client by index', group = 'client'}),
   
   -- Go to next screen
   awful.key({ modkey, 'Control' }, 'j', function () awful.screen.focus_relative( 1) end,
      {description = 'focus the next screen', group = 'screen'}),
   
   -- Go to prev screen
   awful.key({ modkey, 'Control' }, 'k', function () awful.screen.focus_relative(-1) end,
      {description = 'focus the previous screen', group = 'screen'}),
   
   -- Go to urgent client
   awful.key({ modkey,           }, 'u', awful.client.urgent.jumpto,
      {description = 'jump to urgent client', group = 'client'}),
   
   -- Go to previous task
   awful.key({ modkey,           }, 'Tab',
      function ()
         awful.client.focus.history.previous()
         if client.focus then
            client.focus:raise()
         end
      end,
      {description = 'go back', group = 'client'}),
   
   -- Standard programs
   -- Terminal
   awful.key({ modkey,           }, 'Return', function () awful.spawn(vars.appslist.terminal.exec) end,
      {description = 'open a terminal', group = 'launcher'}),
   
   -- Open Browser
   awful.key({modkey}, 'F2', function() awful.spawn(vars.appslist.browser.exec) end,
      {description = 'Open Browser', group = 'launcher'}),
   
   
   -- Open File Manager
   awful.key({modkey}, 'F3', function() awful.spawn(vars.appslist.fileman.exec) end,
      {description = 'Open File Manager', group = 'launcher'}),
   
   -- Open SysReq
   awful.key({modkey}, 'F4', function() awful.spawn(vars.appslist.sysrec.exec) end,
      {description = 'Open System Resource Viewer', group = 'launcher'}),
   
   
   -- Open Music Player
   awful.key({modkey}, 'F5', function() awful.spawn(vars.appslist.music.exec) end,
      {description = 'Open Music Player', group = 'launcher'}),
   
   -- Open Music Player
   awful.key({modkey}, 'F6', function() awful.spawn(vars.appslist.netman.exec) end,
      {description = 'Open Network Manager', group = 'launcher'}),
   
   -- AwesomeWM binds
   -- Restart AwesomeWM
   awful.key({ modkey, 'Control' }, 'r', awesome.restart,
      {description = 'reload awesome', group = 'awesome'}),
   
   -- Quit AwesomeWM
   awful.key({ modkey, 'Shift'   }, 'q', awesome.quit,
      {description = 'quit awesome', group = 'awesome'}),

   -- Scrot
   awful.key({modkey, "Shift"}, "p", function () awful.spawn(vars.appslist.scrshot.exec) end, {description = "Screenshot", group="launcher"}),
   
   -- I
   awful.key({ modkey,           }, 'l',     function () awful.tag.incmwfact( 0.05)          end,
      {description = 'increase master width factor', group = 'layout'}),
   awful.key({ modkey,           }, 'h',     function () awful.tag.incmwfact(-0.05)          end,
      {description = 'decrease master width factor', group = 'layout'}),
   awful.key({ modkey, 'Shift'   }, 'h',     function () awful.tag.incnmaster( 1, nil, true) end,
      {description = 'increase the number of master clients', group = 'layout'}),
   awful.key({ modkey, 'Shift'   }, 'l',     function () awful.tag.incnmaster(-1, nil, true) end,
      {description = 'decrease the number of master clients', group = 'layout'}),
   awful.key({ modkey, 'Control' }, 'h',     function () awful.tag.incncol( 1, nil, true)    end,
      {description = 'increase the number of columns', group = 'layout'}),
   awful.key({ modkey, 'Control' }, 'l',     function () awful.tag.incncol(-1, nil, true)    end,
      {description = 'decrease the number of columns', group = 'layout'}),
   awful.key({ modkey,           }, 'space', function () awful.layout.inc(1)                end,
      {description = 'select next', group = 'layout'}),
   awful.key({ modkey, 'Shift'   }, 'space', function () awful.layout.inc(-1)                end,
      {description = 'select previous', group = 'layout'}),
   
   awful.key({ modkey, 'Control' }, 'n',
      function ()
         local c = awful.client.restore()
         -- Focus restored client
         if c then
            c:emit_signal(
               'request::activate', 'key.unminimize', {raise = true}
            )
         end
      end,
      {description = 'restore minimized', group = 'client'}),

   -- Prompt
   awful.key({ modkey, 'Control' },            'F1',     function () awful.screen.focused().promptbox:run() end,
      {description = 'run prompt', group = 'launcher'}),
   
   awful.key({ modkey }, 'x',
      function ()
         awful.prompt.run {
            prompt       = 'Run Lua code: ',
            textbox      = awful.screen.focused().promptbox.widget,
            exe_callback = awful.util.eval,
            history_path = awful.util.get_cache_dir() .. '/history_eval'
         }
      end,
      {description = 'lua execute prompt', group = 'awesome'}),
   -- Menubar
   awful.key({ modkey }, 'F1', function() menubar.show() end,
      {description = 'show the menubar', group = 'launcher'})
   
)

--}}}

--{{{Tags
for i = 1, 9 do
   M.globalkeys = gears.table.join(M.globalkeys,
                                   -- View tag only.
                                   awful.key({ modkey }, '#' .. i + 9,
                                      function ()
                                         local screen = awful.screen.focused()
                                         local tag = screen.tags[i]
                                         if tag then
                                            tag:view_only()
                                         end
                                      end,
                                      {description = 'view tag #'..i, group = 'tag'}),
                                   -- Toggle tag display.
                                   awful.key({ modkey, 'Control' }, '#' .. i + 9,
                                      function ()
                                         local screen = awful.screen.focused()
                                         local tag = screen.tags[i]
                                         if tag then
                                            awful.tag.viewtoggle(tag)
                                         end
                                      end,
                                      {description = 'toggle tag #' .. i, group = 'tag'}),
                                   -- Move client to tag.
                                   awful.key({ modkey, 'Shift' }, '#' .. i + 9,
                                      function ()
                                         if client.focus then
                                            local tag = client.focus.screen.tags[i]
                                            if tag then
                                               client.focus:move_to_tag(tag)
                                            end
                                         end
                                      end,
                                      {description = 'move focused client to tag #'..i, group = 'tag'}),
                                   -- Toggle tag on focused client.
                                   awful.key({ modkey, 'Control', 'Shift' }, '#' .. i + 9,
                                      function ()
                                         if client.focus then
                                            local tag = client.focus.screen.tags[i]
                                            if tag then
                                               client.focus:toggle_tag(tag)
                                            end
                                         end
                                      end,
                                      {description = 'toggle focused client on tag #' .. i, group = 'tag'})
   )
end

--}}}

--{{{Click handler

M.clientkeys = gears.table.join(
   -- working toggle itlebar
   awful.key({ modkey, 'Control' }, 't', function (c) awful.titlebar.toggle(c)         end,
      {description = 'Show/Hide Titlebars', group='client'}),
   
   awful.key({ modkey,           }, 'f',
      function (c)
         c.fullscreen = not c.fullscreen
         c:raise()
      end,
      {description = 'toggle fullscreen', group = 'client'}),
   awful.key({ modkey,}, 'q',      function (c) c:kill()                         end,
      {description = 'close', group = 'client'}),
   
   awful.key({ modkey, 'Control' }, 'space',  awful.client.floating.toggle                     ,
      {description = 'toggle floating', group = 'client'}),
   
   awful.key({ modkey, 'Control' }, 'Return', function (c) c:swap(awful.client.getmaster()) end,
      {description = 'move to master', group = 'client'}),
   
   awful.key({ modkey,           }, 'o',      function (c) c:move_to_screen()               end,
      {description = 'move to screen', group = 'client'}),
   
   awful.key({ modkey,           }, 't',      function (c) c.ontop = not c.ontop            end,
      {description = 'toggle keep on top', group = 'client'}),
   
   awful.key({ modkey,           }, 'n',
      function (c)
         -- The client currently has the input focus, so it cannot be
         -- minimized, since minimized clients can't have the focus.
         c.minimized = true
      end ,
      {description = 'minimize', group = 'client'}),
   
   awful.key({ modkey,           }, 'm',
      function (c)
         c.maximized = not c.maximized
         c:raise()
      end ,
      {description = '(un)maximize', group = 'client'}),
   
   awful.key({ modkey, 'Control' }, 'm',
      function (c)
         c.maximized_vertical = not c.maximized_vertical
         c:raise()
      end ,
      {description = '(un)maximize vertically', group = 'client'}),

   awful.key({ modkey, 'Shift'   }, 'm',
      function (c)
         c.maximized_horizontal = not c.maximized_horizontal
         c:raise()
      end ,
      {description = '(un)maximize horizontally', group = 'client'})
   )

--{{{Click signals
M.clientbuttons = gears.table.join(
   awful.button({ }, 1, function (c)
         c:emit_signal('request::activate', 'mouse_click', {raise = true})
   end),
   awful.button({ modkey }, 1, function (c)
         c:emit_signal('request::activate', 'mouse_click', {raise = true})
         awful.mouse.client.move(c)
   end),
   awful.button({ modkey }, 3, function (c)
         c:emit_signal('request::activate', 'mouse_click', {raise = true})
         awful.mouse.client.resize(c)
   end)
)
--}}}
--}}}

root.keys(M.globalkeys)

return M
