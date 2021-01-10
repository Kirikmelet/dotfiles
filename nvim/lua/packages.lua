local vim = vim

vim.cmd[[packadd! packer.nvim]]

return require('packer').startup(function()

   use('~/.config/nvim/pack/test/start/gitfug.lua')

   -- Don't Delete!

   use {'wbthomason/packer.nvim', opt = true}

   -- Theme:

   use {'morhetz/gruvbox'}

   -- Git:

   use {'tpope/vim-fugitive', cmd = 'Git', opt=true}

   -- LSP:

   use {
      {'neovim/nvim-lspconfig', opt=true};
      {'nvim-lua/completion-nvim', opt=true};
      {'tjdevries/lsp_extensions.nvim', opt=true};
      {'nvim-treesitter/nvim-treesitter', opt=true};
   }

   -- Telescope

   use {
      'nvim-telescope/telescope.nvim';
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}};
   }

end)
