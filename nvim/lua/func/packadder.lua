local vim = vim
local M = {}


function M.packadd(table)
   for _,i in ipairs(table) do
      vim.cmd('packadd! '..i)
   end
end

return M
