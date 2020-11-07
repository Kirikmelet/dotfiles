local vim = vim

vim.cmd[[packadd! packer.nvim]]

return require('packer').startup(function()

	use('~/.config/nvim/pack/test/start/gitfug.lua')

	-- Don't Delete!

	use {'wbthomason/packer.nvim', opt = true}

	-- Gruvbox:

	use {'morhetz/gruvbox'}

	-- Git:

	use {'tpope/vim-fugitive', cmd = 'Git', opt=true}

	-- FTPlugin Plugin:

	use {'sheerun/vim-polyglot', opt = true}

	-- LSP:

	use {
		{'neovim/nvim-lspconfig', opt=true};
		{'nvim-lua/diagnostic-nvim', opt=true};
		{'nvim-lua/completion-nvim', opt=true};
		{'nvim-treesitter/nvim-treesitter', opt=true};
		{'nvim-treesitter/completion-treesitter', opt=true};
		{'tjdevries/lsp_extensions.nvim', opt=true};
	}

   -- Telescope.nvim

   use {
      {'nvim-lua/plenary.nvim', opt = true};
      {'nvim-lua/popup.nvim', opt = true};
      {'nvim-lua/telescope.nvim', opt = true};
   }

end)
