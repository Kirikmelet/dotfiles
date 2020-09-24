local vim = vim
local api = vim.api
local M = {}

--local packerE = pcall(vim.cmd[[packadd packer.nvim]])
--
--if not packerE then
--	if vim.fn.input('Download packer.nvim? [y/n]') ~= 'y' then
--		return
--	end
--
--
--	local packerDirectory = string.format(
--		'%s/site/pack/packer/opt',
--		vim.fn.stdpath('data')
--		)
--
--	vim.fn.mkdir(packerDirectory, 'p')
--
--	local out = vim.fn.system(string.format(
--			'git clone %s %s',
--			'https://github.com/wbthomason/packer.nvim',
--		packerDirectory..'/packer/nvim'))
--	print(out)
--	print('Downloading packer.nvim')
--end

vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function()

	use('~/.config/nvim/pack/test/start/gitfug.lua')

	-- Don't Delete!
	use {'wbthomason/packer.nvim', opt = true}

   ---- Lua stuff
   --use {{'nvim-lua/popup.nvim', opt=true}, {'nvim-lua/plenary.nvim', opt=true}}

   ---- Telescope
   --use {'nvim-lua/telescope.nvim', opt=true}

   -- Shougo plugins
   use {{'Shougo/denite.nvim', opt=true}, {'Shougo/defx.nvim', opt=true}}

	-- Markdown:
--	use {'iamcco/markdown-preview.nvim';
--		opt = true;
--		ft = {'markdown', 'pandoc.markdown', 'rmd'};
--		run = 'sh -c "cd app & npm install"';
--	}

	-- Fuzzy

	-- Gruvbox:
	use {'morhetz/gruvbox'}

	-- Git:
	use {'tpope/vim-fugitive'}

	-- FTPlugin Plugin:

	use {'sheerun/vim-polyglot'}

	-- File Formatting:
	use {'sbdchd/neoformat';
		opt = true;
		cmd = 'Neoformat';
	}

	-- Vimwiki:
	--use {'vimwiki/vimwiki';
	--	opt = true;
	--	cmd = 'VimwikiIndex'
	--}

	-- ORG-Mode
	use {'jceb/vim-orgmode', opt=true}

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

   -- FZF
end)
