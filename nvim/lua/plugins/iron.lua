local vim = vim
local api = vim.api
local iron = require('iron')


iron.core.add_repl_definitions {}

iron.core.set_config {
	preferred = {
		python = 'ipython';
	}
}
