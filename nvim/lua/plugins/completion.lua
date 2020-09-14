local vim = vim
local api = vim.api



vim.g.completion_matching_strategy_list = {'exact','substring','fuzzy'}
vim.g.diagnostic_enable_virtual_text = 1

local shortopt = vim.o.shortmess
vim.o.shortmess = shortopt..'c'
