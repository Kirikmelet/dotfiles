require('vis')
local M = {}

function M:setup(settings, win)
   if settings == nil then return end
   local curFT = settings[win.syntax]
   if not curFT then M:default(settings, win) end
   if type(curFT) == 'table' then
       for _,i in ipairs(curFT) do
           vis:command(i)
       end
   elseif type(curFT) == 'function' then
       curFT(win)
   else return end
end

function M:default(settings, win)
   if settings == nil then return end
   local curFT = settings['default']
   if type(curFT) == 'table' then
      for _,i in ipairs(curFT) do
         vis:command(i)
      end
   elseif type(curFT) == 'function' then
      curCT(win)
   else return end
end

return M
