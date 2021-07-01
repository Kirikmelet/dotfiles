local vim = vim

require('func/bootstrap-package')


vim.cmd[[packadd! packer.nvim]]

local use = require('packer').use

return require('packer').startup(function()

   --use('~/.config/nvim/pack/test/start/gitfug.lua')

   -- Don't Delete!

   use {'wbthomason/packer.nvim', opt = true}

   -- Theme:

   --use {'morhetz/gruvbox'}
   use 'ayu-theme/ayu-vim'
   -- Git:

   use {
      'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim',
      opt=true
   }

   -- LSP:

   use {
      {'neovim/nvim-lspconfig', opt=true };
      --{'nvim-lua/completion-nvim' };
      {'hrsh7th/nvim-compe', opt=true};
      {'tjdevries/lsp_extensions.nvim', opt=true};
      {'nvim-treesitter/nvim-treesitter', opt=true};
      {'glepnir/lspsaga.nvim', opt=true};
      --{'mhartington/formatter.nvim' };
   }

   -- Fuzzy Search

--   use {
--      'nvim-telescope/telescope.nvim';
--      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}};
--      opt = true;
--   }
   use {
      'camspiers/snap',
      --rocks = {'fzy'};
      opt=true;
   }

   -- Autopairs

   use {
      'windwp/nvim-autopairs';
      opt=true
   }


   -- Orgmode

   use {
      'kristijanhusak/orgmode.nvim';
      opt=true
   }

   -- Buffer

   use {
      'kevinhwang91/nvim-bqf';
      opt=true
   }

   -- Discord
   use {
      'andweeb/presence.nvim';
   }


   -- Which Key
   use {
      'folke/which-key.nvim';
      opt = true
   }

end)
