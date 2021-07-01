local vim = vim
local api = vim.api

require('func.packadder').packadd({'neogit', 'plenary.nvim'})

local neogit = require('neogit')

neogit.setup()
