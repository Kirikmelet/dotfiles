local vim = vim
local api = vim.api



vim.g.completion_matching_strategy_list = {'exact','substring','fuzzy'}
vim.g.diagnostic_enable_virtual_text = 1

local shortopt = api.nvim_get_option('shortmess')
shortopt = shortopt .. 'c'
api.nvim_set_option('shortmess',shortopt)
