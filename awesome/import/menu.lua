local gears = require('gears')
local awful = require('awful')
local beautiful = require('beautiful')
local hkp = require('awful.hotkeys_popup')
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
local vars = require('import/vars')
local M = {}


menubar.utils.terminal = vars.appslist.terminal


--{{{Values
local awesomemenuopts = {

   {'hotkeys', function () hotkeys_popup.show_help(nil, awful.screen.focused()) end};
   {'manual', vars.appslist.terminal.exec..' -e man awesome'};
   {'restart', awesome.restart};
   {'quit', function() awesome.quit() end};
}

local devapps = {
   {'Editors', {
         {'EMACS', function() awful.spawn('emacs')end};
         {'Neovim', vars.appslist.editor.exec};
         {'Kakoune', function() awful.spawn(vars.appslist.terminal.exec..' -e '..'kak') end};
      }
   };
   {'REPLs', {
         {'POSIX Shell', function() awful.spawn(vars.appslist.terminal.exec..' -e sh')end};
         {'Bash', function() awful.spawn(vars.appslist.terminal.exec..' -e bash')end};
         {'Lua', function() awful.spawn(vars.appslist.terminal.exec..' -e lua')end};
         {'Python', function() awful.spawn(vars.appslist.terminal.exec..' -e ipython')end};
         {'Fennel', function() awful.spawn(vars.appslist.terminal.exec..' -e fennel')end};
   }}

}


local powermenu = {
   {'Power off', function() awful.spawn('poweroff') end};
   {'Restart', function() awful.spawn('reboot') end};

}

M.mainmenuopts = awful.menu(
   {
      items = {
         {'awesome', awesomemenuopts, beautiful.awesome_icon};
         {'Dev Apps', devapps};
         {'Power Menu', powermenu};
         {'',nil};
         {'Terminal', vars.appslist.terminal.exec};
         {'Editor', vars.appslist.editor.exec};
         {'Browser', vars.appslist.browser.exec};
         {'FileMan', vars.appslist.fileman.exec};
         {'SysRec', vars.appslist.sysrec.exec};
         {'Music', vars.appslist.music.exec};
         {'NetMan', vars.appslist.netman.exec};
      }
   }
   )

--}}}

--{{{Menu Proper
M.launcher = awful.widget.launcher({
      image = beautiful.awesome_icon,
      menu = M.mainmenuopts
   })
--}}}


return M
