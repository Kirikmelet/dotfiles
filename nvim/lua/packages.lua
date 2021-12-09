local vim = vim

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
            'hrsh7th/nvim-cmp', opt=true,
            event='InsertEnter *',
            -- config = [[require'plugins.completion']],
            requires = {
               'hrsh7th/cmp-buffer',
               'hrsh7th/cmp-path',
               'hrsh7th/cmp-cmdline',
            },
         };
         {
            'tjdevries/lsp_extensions.nvim',
            opt=true
         };
         {'nvim-treesitter/nvim-treesitter', opt=true};
         {'glepnir/lspsaga.nvim', opt=true};
               {'hrsh7th/cmp-nvim-lsp', opt=true},
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
      'nvim-orgmode/orgmode';
      config = function()
         require('orgmode').setup({
            org_agenda_files = {'~/org/global_agenda/*'}
         })
         local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
         parser_config.org = {
            install_info = {
               url = 'https://github.com/milisims/tree-sitter-org',
               revision = 'main',
               files = {'src/parser.c', 'src/scanner.cc'},
            },
            filetype = 'org',
         }
      end,
      --ft = 'org',
      --keys = {'n', '<leader>o'}
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
   -- filetype.nvim
   use {'nathom/filetype.nvim'}
end)
