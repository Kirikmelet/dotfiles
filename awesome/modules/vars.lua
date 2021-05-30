-- vars.lua
-- Handles variables

local M = {}

M.keys = {
   modkey = "Mod4"
}

M.appslist = {
   terminal = {exec = "xfce4-terminal"};
   editor = {exec = os.getenv("EDITOR") or "emacs -nw", term = true};
   fileman = {exec = "thunar", term = false};
   browser = {exec = "firefox"};
   netman = {exec = "nm-connection-editor", term = false};
   music = {exec = "pragha", term = false};
   sysrec = {exec = "htop", term = true};
   scrshot = {exec = "scrot -e 'mv $f ~/Pictures/linux_scrot/' ", term = false}
}

for _,i in pairs(M.appslist) do
   if i.term then
      i.exec = M.appslist.terminal.exec .. " -e " .. i.exec
   end
end

return M
