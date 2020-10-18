local vim = vim
local api = vim.api

--{{{GUI Settings

vim.o.guifont = 'Fira Code Retina:s14'

--}}}

--{{{Colorscheme

vim.g.colors_name = 'gruvbox'
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.g.gruvbox_italic = 1

--}}}

-- Set Leader Key

vim.g.mapleader = ' '

--{{{ Syntax and stuff

vim.o.compatible = false
vim.o.number = false
vim.o.expandtab = true
vim.o.ruler = true
vim.o.smarttab = true
vim.o.shiftround = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.hidden = true
vim.o.showmode = true
vim.o.showcmd = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.lazyredraw = false
vim.o.splitbelow = true
vim.wo.cursorline = true
vim.o.wrapscan = true
vim.o.laststatus = 2
vim.o.softtabstop = 4
vim.o.mouse = 'a'
vim.o.updatetime = 300
vim.o.backspace = 'indent,eol,start'
vim.o.display = 'lastline'
vim.o.report = 2
vim.o.synmaxcol = 200
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.inccommand = 'split'
vim.wo.foldmethod = 'marker'
vim.bo.omnifunc="v:lua.vim.lsp.omnifunc"

vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')

--}}}

-- {{{App Disable

-- 1 - Disable
-- 0 - Enable

vim.g.loaded_gzip = 1
vim.g.loaded_tar =1
vim.g.tarPlugin = 1
vim.g.zip = 1
vim.g.zipPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.vimball = 1
vim.g.vimballPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1
--vim.g.loaded_netrwSettings = 1
--vim.g.loaded_netrwFileHandlers = 1

--}}}

--{{{Disable providers

-- 1 - Enable
-- 0 - Disable

vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

--}}}

