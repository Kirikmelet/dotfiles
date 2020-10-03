vim = vim
local api = vim.api

-- Load plugins
require('packages')

-- Load options
require('options')

-- Modules
--
-- Uncomment to enable
-- Comment to disable
--
-- Restart neovim to see changes

-- Tools
require('plugins/statusline')
--require('plugins/format')
require('plugins/telescope')

-- Looks
require('plugins/polyglot')

-- CSS Colors
--require('plugins/colorizer')

-- File Manager
--require('plugins/nvim-tree')
require('plugins/defx')

-- LSP
require('plugins/completion')
require('plugins/treesitter')
require('plugins/lsp')

-- Other files

require('hotkeys')
require('autopairs')
