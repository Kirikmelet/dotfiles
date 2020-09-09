local vim = vim
local api = vim.api


local runpath = api.nvim_get_option('runtimepath')..',/home/troyd/.cache/dein/repos/github.com/Shougo/dein.vim'
api.nvim_set_option('runtimepath',runpath)

local dein_path = '/home/troyd/.cache/dein'


--local plugconf = 
--{
--	markdown-preview = 
--	{
--		on_ft = {'markdown', 'pandoc.markdown', 'rmd', 'vimwiki'};
--		build = 'sh -c "cd & npm install"';
--	};
--	vimwiki = 
--	{
--		on_cmd = 'VimwikiIndex';
--	};
--	file_format = 
--	{
--		on_cmd = 'Neoformat';
--	};
--	vim-speeddating = 
--	{
--		on_ft = 'org'
--	};
--	vim-repeat = 
--	{
--		on_ft = 'org'
--	};
--	calendar = 
--	{
--		on_cmd = 'Calendar'
--	};
--}


vim.fn['dein#load_state'](dein_path)
vim.fn['dein#begin'](dein_path)

vim.fn['dein#add']('/home/troyd/.cache/dein/repos/github.com/Shougo/dein.vim')

-- Shougo Plugins
vim.fn['dein#add']('Shougo/denite.nvim')
vim.fn['dein#add']('Shougo/defx.nvim')

-- FTPlugin Plugins
vim.fn['dein#add']('sheerun/vim-polyglot')

-- LSP
vim.fn['dein#add']('neovim/nvim-lsp')
vim.fn['dein#add']('nvim-lua/diagnostic-nvim')
vim.fn['dein#add']('nvim-lua/completition-nvim')

-- Statusline
vim.fn['dein#add']('itchyny/lightline.vim')

-- File Formatting
vim.fn['dein#add']('sbdchd/neoformat', {on_cmd = 'Neoformat'})

-- Git
vim.fn['dein#add']('tpope/vim-fugitive')


-- Markdown
vim.fn['dein#add']('iamcco/markdown-preview.nvim', {
	on_ft = {'markdown', 'pandoc.markdown', 'rmd', 'vimwiki'};
	build = 'sh -c "cd app && npm install"';
})

-- Gruvbox
vim.fn['dein#add']('shinchu/lightline-gruvbox.vim')
vim.fn['dein#add']('morhetz/gruvbox')

-- Org-mode
vim.fn['dein#add']('jceb/vim-orgmode')
vim.fn['dein#add']('tpope/vim-speeddating', {on_ft = 'org'})
vim.fn['dein#add']('tpope/vim-repeat', {on_ft = 'org'})

-- VimWiki
vim.fn['dein#add']('vimwiki/vimwiki', {on_cmd = 'VimwikiIndex'})

vim.fn['dein#end']()
vim.fn['dein#save_state']()

