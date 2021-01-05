require('vis')
local M = {}

function M:setup(settings, win)
   if settings == nil then return end
   local curFT = settings[win.syntax]
   if type(curFT) == 'table' then
       for _,i in pairs(curFT) do
           vis:command(i)
       end
   elseif type(curFT) == 'function' then
       curFT(win)
   else return end
end


return M
