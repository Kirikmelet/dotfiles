local vim = vim
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
require('plugins/netrw')

-- Looks
--require('plugins/polyglot')

-- LSP
require('plugins/completion')
require('plugins/treesitter')
require('plugins/lsp')

-- Other files

require('hotkeys')
require('autopairs')
