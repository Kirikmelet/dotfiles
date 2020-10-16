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
vim.g.completion_auto_change_source = 1
vim.g.completion_trigger_on_delete = 1

vim.g.completions_chain_complete_list = {
   default = {
      default = {
         {complete_items = {'lsp', 'snippet', 'path'}};
         {mode = 'file'};
      },
      comment = {},
      string = {}
   },
   vim = {
      {complete_items = {'snippet', 'path'}},
      {mode = 'cmd'}
   },
   c = {
      {complete_items = {'ts', 'lsp', 'path'}},
   },
   python = {
      {complete_items = {'ts', 'lsp', 'path'}},
   },
   lua = {
      {complete_items = {'ts', 'lsp', 'path'}},
   },

}

vim.o.shortmess = vim.o.shortmess..'c'
