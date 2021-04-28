local vim = vim

require('func/bootstrap-package')

vim.cmd[[packadd! packer.nvim]]

local use = require('packer').use

return require('packer').startup(function()

   --use('~/.config/nvim/pack/test/start/gitfug.lua')

   -- Don't Delete!

   use {'wbthomason/packer.nvim', opt = true}

   -- Theme:

   use {'morhetz/gruvbox'}

   -- Git:

   use {'tpope/vim-fugitive', cmd = 'Git', opt=true}

   -- LSP:

   use {
      {'neovim/nvim-lspconfig', opt=true};
      --{'nvim-lua/completion-nvim', opt=true};
      {'hrsh7th/nvim-compe', opt=true};
      {'tjdevries/lsp_extensions.nvim', opt=true};
      {'nvim-treesitter/nvim-treesitter', opt=true};
      {'glepnir/lspsaga.nvim', opt=true};
      --{'mhartington/formatter.nvim', opt=true};
   }

   -- Telescope

   use {
      'nvim-telescope/telescope.nvim';
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}};
      opt = true;
   }

   -- Autopairs

   use {
      'windwp/nvim-autopairs';
      opt=true;
   }

end)
