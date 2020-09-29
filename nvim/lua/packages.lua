local vim = vim
local api = vim.api
local M = {}

vim.cmd[[packadd! packer.nvim]]

return require('packer').startup(function()

	use('~/.config/nvim/pack/test/start/gitfug.lua')


	-- Test

	-- Don't Delete!

	use {'Kirikmelet/packer.nvim', opt = true}

   -- Shougo plugins

   use {{'Shougo/denite.nvim', opt=true}, {'Shougo/defx.nvim', opt=true}}

	-- Gruvbox:

	use {'morhetz/gruvbox'}

	-- Git:

	use {'tpope/vim-fugitive', cmd = 'Git', opt=true}

	-- FTPlugin Plugin:

	use {'sheerun/vim-polyglot'}

	-- LSP:

	use {
		{'neovim/nvim-lspconfig', opt=true};
		{'nvim-lua/diagnostic-nvim', opt=true};
		{'nvim-lua/completion-nvim', opt=true};
		{'nvim-treesitter/nvim-treesitter', opt=true};
		{'nvim-treesitter/completion-treesitter', opt=true};
		{'tjdevries/lsp_extensions.nvim', opt=true};
	}

   -- REPL
   use {'hkupty/iron.nvim'}

end)
