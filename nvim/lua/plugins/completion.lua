local vim = vim
local api = vim.api
local plugman = require('func/packadder')

plugman.packadd({
   'completion-nvim',
   'diagnostic-nvim',
   'completion-treesitter'
})


vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_trimmed_virtual_text = '40'
vim.g.diagnostic_insert_delay = 1
vim.g.completion_matching_strategy_list = {'exact','substring','fuzzy'}

vim.g.completions_chain_complete_list = {
   default = {
      default = {
         {complete_items = {'lsp', 'snippet'}};
         {mode = 'file'}
      },
      comment = {},
      string = {}
   },
   vim = {
      {complete_items = {'snippet'}},
      {mode = 'cmd'}
   },
   c = {
      {complete_items = {'ts'}},
   },
   python = {
      {complete_items = {'ts'}},
   },
   lua = {
      {complete_items = {'ts'}},
   },

}

vim.o.shortmess = vim.o.shortmess..'c'
