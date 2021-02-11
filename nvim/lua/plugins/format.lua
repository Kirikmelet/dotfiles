local vim = vim
local plugman = require('func/packadder')
plugman.packadd({
   'formatter.nvim'
})

require('formatter').setup({
   logging = false;
   filetype = {
      typescript = {
         function()
            return {
               exe = 'eslint';
               args = {'--stdin-filename', vim.api.nvim_buf_get_name(0), '--fix'};
               stdin = true
            }
         end
      }
   }
})
