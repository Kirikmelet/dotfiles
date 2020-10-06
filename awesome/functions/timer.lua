-- Timer function
local M = {}

function Init(span, call)

   local curtime = os.time()

   while true do
   local newtime = os.difftime(os.time(), curtime)
      if newtime > span then
         call()
         M.init(span, call)
         break
      end
   end
end

return setmetatable(M, {__call = function(span, call) Init(span, call) end})
