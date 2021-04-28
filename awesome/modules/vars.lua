-- vars.lua
-- Handles variables

local M = {}

M.keys = {
   modkey = "Mod4"
}

M.appslist = {
   terminal = {exec = "alacritty"};
   editor = {exec = os.getenv("EDITOR") or "emacs -nw", term = true};
   fileman = {exec = "nnn", term = true};
   browser = {exec = "firefox"};
   netman = {exec = "iwctl", term = true};
   music = {exec = "ncmpcpp", term = true};
   sysrec = {exec = "htop", term = true};
   scrshot = {exec = "scrot -e 'mv $f ~/Pictures/linux_scrot/' ", term = false}
}

for _,i in pairs(M.appslist) do
   if i.term then
      i.exec = M.appslist.terminal.exec .. " -e " .. i.exec
   end
end

return M
