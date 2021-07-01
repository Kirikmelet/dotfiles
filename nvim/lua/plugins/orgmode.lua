local vim = vim
local api = vim.api

require('func/packadder').packadd({'orgmode.nvim'})

require('orgmode').setup({
   org_agenda_files = {'~/org/global_agenda/*'}
})
