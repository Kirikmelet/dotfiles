local vim = vim
local api = vim.api
local plugman = require('func/packadder')

plugman.packadd({'nvim-treesitter'})

require'nvim-treesitter.configs'.setup {
	ensure_installed = {'c', 'python', 'html', 'javascript', 'bash', 'cpp', 'rust', 'lua'};
	highlight = {
		enable = true,
		disable = {},
	},
	incremental_selection = {
		enable = true,
		disable = {},
		keymaps = {
			init_selection = 'gnn',
			node_incremental = 'grn',
			scope_incremental = 'grc',
			node_decremental = 'grm',
		}
	},
	refactor = {
		highlight_defintions = {
			enable = true
		},
		smart_rename = {
			enable = true,
			smart_rename = 'grr'
		},
		navigation = {
			enable = true,
			goto_definition = 'gnd',
			list_definitions = 'gnD'
		},
      highlight_scope = { enable = true},
	},
}
