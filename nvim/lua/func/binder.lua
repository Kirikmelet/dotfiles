local vim = vim
local api = vim.api

return function(dicter)
   for _, dict in ipairs(dicter) do
      if not dict[4] then
         dict[4]  = {silent = true, noremap = true}
      elseif dict[5] then
         api.nvim_buf_set_keymap(dict[5], dict[1], dict[3], dict[4])
      end
      api.nvim_set_keymap(dict[1], dict[2], dict[3], dict[4])
   end
end
