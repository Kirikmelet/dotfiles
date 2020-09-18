local vim = vim
local api = vim.api

require('format').setup({
  javascript = {
      prettier = function()
        returns {
          exe = "standard",
          args = {"--stdin", vim.api.nvim_buf_get_name(0), '--fix'},
          stdin = true
        }
      end
  },
  lua = {
      luafmt = function()
        return {
          exe = "luafmt",
          args = {"--indent-count", 2, "--stdin"},
          stdin = true
        }
      end
    }
})
