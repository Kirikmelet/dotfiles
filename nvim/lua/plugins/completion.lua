local vim = vim
local api = vim.api
local plugman = require('func/packadder')

plugman.packadd({
   'nvim-compe'
})

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = "enable";
  allow_prefix_unmatch = false;
  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
    nvim_lua = true;
    orgmode = true;
  };
  documentation = true
}


--vim.g.completion_matching_strategy_list = {'exact','substring','fuzzy'}
--vim.g.completion_auto_change_source = 1
--vim.g.completion_trigger_on_delete = 1
--
--vim.g.completions_chain_complete_list = {
--   default = {
--      default = {
--         {complete_items = {'lsp', 'snippet', 'path'}};
--         {mode = 'file'};
--      },
--      comment = {},
--      string = {}
--   },
--   vim = {
--      {complete_items = {'snippet', 'path'}},
--      {mode = 'cmd'}
--   },
--   c = {
--      {complete_items = {'ts', 'lsp', 'path', 'snippet'}},
--   },
--   python = {
--      {complete_items = {'ts', 'lsp', 'path', 'snippet'}},
--   },
--   lua = {
--      {complete_items = {'ts', 'lsp', 'path'}},
--   },
--   javascript = {
--      {complete_items = {'ts', 'lsp', 'path', 'snippet'}},
--   },
--   typescript = {
--      {complete_items = {'ts', 'lsp', 'path', 'snippet'}},
--   },
--
--}

vim.o.shortmess = vim.o.shortmess..'c'
