local vim = vim
local packer = require('func.packadder').packadd

require('func/bootstrap-package')


vim.cmd[[packadd! packer.nvim]]

local use = require('packer').use

return require('packer').startup(function()
   -- Don't Delete!
   use {'wbthomason/packer.nvim', opt = true}
   -- Theme:
   --use {'morhetz/gruvbox'}
   --use 'ayu-theme/ayu-vim'
   use {'npxbr/gruvbox.nvim', requires = {'rktjmp/lush.nvim'}}
   -- Git:
   use {
      'TimUntersberger/neogit',
      requires = 'nvim-lua/plenary.nvim',
      opt=true,
   }
   -- LSP:
   use {
      'neovim/nvim-lspconfig', opt=true, requires = {
         {
            'hrsh7th/nvim-compe', opt=true,
            event='InsertEnter *',
            config = [[require'plugins.completion']]
         };
         {
            'tjdevries/lsp_extensions.nvim',
            opt=true
         };
         {'nvim-treesitter/nvim-treesitter', opt=true};
         {'glepnir/lspsaga.nvim', opt=true};
      },
      --{'mhartington/formatter.nvim' };
   }
   -- Fuzzy Search
   use {
      'nvim-telescope/telescope.nvim';
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}};
      opt = true;
   }
   -- Autopairs
   use {
      'windwp/nvim-autopairs';
      event='InsertEnter *';
      config = [[require'plugins.autopairs']]
   }
   -- Orgmode
   use {
      'kristijanhusak/orgmode.nvim';
      opt=true,
      config = function()
         require('orgmode').setup({
            org_agenda_files = {'~/org/global_agenda/*'}
         })
      end,
      ft = 'org',
      keys = {'n', '<leader>o'}
   }
   -- Quickbuffer
   use {
      'kevinhwang91/nvim-bqf';
      opt=true,
      config = [[require'plugins.bqf']],
      ft = {'qf', 'lol'}
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
   -- Statusline
    use {'hoob3rt/lualine.nvim'; opt=true};
   -- Icons
   use {'kyazdani42/nvim-web-devicons'}
   -- QML
   use {
      'peterhoeg/vim-qml'
   }
   -- GLSL
   use {'tikhomirov/vim-glsl', ft='glsl'}
   -- FIle Explorer
   use {
      'tamago324/lir.nvim', requires = {
         {'nvim-lua/plenary.nvim', opt=true},
         {'kyazdani42/nvim-web-devicons'}
      },
      opt=true,
   }
end)
