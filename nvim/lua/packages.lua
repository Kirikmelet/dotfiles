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

	-- LSP:

	use {
		{'neovim/nvim-lspconfig', opt=true};
		{'nvim-lua/completion-nvim', opt=true};
		{'nvim-treesitter/nvim-treesitter', opt=true};
	}

end)
