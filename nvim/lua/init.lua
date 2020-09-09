local vim = vim
local api = vim.api

-- Load plugins
--require('dein')
--require('packages') -- Is not as easy to config as dein (Denite config not working, manual setting of runtimepath for lsp)
-- Is also not as fast as dein (9 ms diff)

-- GUI Settings (gnvim)
api.nvim_set_option('guifont', 'Fira Code:h14')

-- Colorscheme
vim.cmd('colorscheme gruvbox')
api.nvim_set_option('termguicolors',false)
api.nvim_set_var('gruvbox_italic',1)

-- Set Leader

vim.g.mapleader = ' '

--{{{ Syntax and stuff

api.nvim_set_option('compatible',false)
api.nvim_set_option('number',false)
api.nvim_set_option('expandtab',true)
api.nvim_set_option('ruler',true)
api.nvim_set_option('smarttab',true)
api.nvim_set_option('shiftround',true)
api.nvim_set_option('smartindent',true)
api.nvim_set_option('autoindent',true)
api.nvim_set_option('hidden',true)
api.nvim_set_option('showmode',true)
api.nvim_set_option('showcmd',true)
api.nvim_set_option('incsearch',true)
api.nvim_set_option('hlsearch',true)
api.nvim_set_option('lazyredraw',true)
api.nvim_set_option('splitbelow',true)
api.nvim_set_option('cursorline',true)
api.nvim_set_option('wrapscan',true)
api.nvim_set_option('laststatus',2)
api.nvim_set_option('softtabstop',4)
api.nvim_set_option('mouse','a')
api.nvim_set_option('updatetime',300)
api.nvim_set_option('backspace','indent,eol,start')
api.nvim_set_option('display','lastline')
api.nvim_set_option('report',0)
api.nvim_set_option('synmaxcol',200)
api.nvim_set_option('completeopt','menuone,noinsert,noselect')
api.nvim_set_option('inccommand','split')
vim.wo.foldmethod = 'marker'

vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')

--}}}

-- {{{App Disable

-- 1 - Disable
-- 0 - Enable

api.nvim_set_var('loaded_gzip',1)
api.nvim_set_var('loaded_tar',1)
api.nvim_set_var('tarPlugin',1)
api.nvim_set_var('zip',1)
api.nvim_set_var('zipPlugin',1)
api.nvim_set_var('loaded_getscript',1)
api.nvim_set_var('loaded_getscriptPlugin',1)
api.nvim_set_var('vimball',1)
api.nvim_set_var('vimballPlugin',1)
api.nvim_set_var('loaded_matchit',1)
api.nvim_set_var('loaded_matchparen',1)
api.nvim_set_var('loaded_2html_plugin',1)
api.nvim_set_var('loaded_logiPat',1)
api.nvim_set_var('loaded_rrhelper',1)
api.nvim_set_var('loaded_netrw',1)
api.nvim_set_var('loaded_netrwPlugin',1)
api.nvim_set_var('loaded_netrwSettings',1)
api.nvim_set_var('loaded_netrwFileHandlers',1)
--}}}


require('plugins/statusline')
require('plugins/neoformat')
-- CSS Colors
--require('plugins/colorizer')
-- Shougo Plugins:
require('plugins/denite')
require('plugins/defx')
-- LSP
require('plugins/lsp')
require('plugins/completion')
-- Org-mode & Vimwiki
require('plugins/orgmode')
require('plugins/vimwiki')
-- Other files
require('key')
require('hotkeys')
require('folding')
