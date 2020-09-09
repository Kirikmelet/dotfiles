local vim = vim
local api = vim.api
local M = {}


local function bufbind(buf, mode, key, cmd, opts)
	if opts == nil then
		opts= {noremap = true, silent = true, expr = true}
	end
	api.nvim_buf_set_keymap(buf, mode, key, cmd, opts)
end

vim.fn['denite#custom#option']('_',
		{
			split = 'horizontal';
			winheight = 5;
			start_filter = false;
			smartcase =  true;
			source_names = 'short';
			highlight_filet_background = 'NormalFloat';
			prompt = '>$';
			floating_preview = true;
			statusline = false;
		})


vim.fn['denite#custom#var']('grep',
	{
		command = {'rg'};
		default_opts = {'-i', '--vimgrep', '--no-heading'};
		recursive_opts =  {};
		pattern_opt =  {'--regexp'};
		final_opts = {};
	}
	)




local menfconf = {
	config = {
		description = 'Neovim Config';
		file_candidates = {
			{'Nvim Init', '~/.config/nvim/init.vim'};
			{'Lua Init', '~/.config/nvim/lua/init.lua'}
		};
	};
	git = {
		description = 'Does GIT';
		command_candidates = {
			{'View Current Status', 'G'};
			{'Add all files in (current) directory (RECURSIVE!)', 'Git add .'};
			{'Git cd to root directory', 'Gcd'};
			{'Git Commit', 'Gcommit'};
			{'Git Push', 'Gpush'};
		};
	};
}
vim.fn['denite#custom#var']('menu','menus',menfconf)

function M._on_ft_denite_bind()
	local buf = api.nvim_get_current_buf()
	bufbind(buf, 'n', '<CR>', 'denite#do_map("do_action")',nil)
	bufbind(buf, 'n', 'd', 'denite#do_map("do_action", "delete")',nil)
	bufbind(buf, 'n', 'p', 'denite#do_map("do_action", "preview")',nil)
	bufbind(buf, 'n', 'q', 'denite#do_map("quit")',nil)
	bufbind(buf, 'n', '/', 'denite#do_map("open_filter_buffer")',nil)
	bufbind(buf, 'n', '<Space>', 'denite#do_map("toggle_select")."j"',nil)
	bufbind(buf, 'n', 'i', 'denite#do_map("do_action", "vsplit")',nil)
	bufbind(buf, 'n', 'v', 'denite#do_map("do_action", "split")',nil)
	bufbind(buf, 'n', 't', 'denite#do_map("do_action", "tabopen")',nil)
	bufbind(buf, 'n', 's', 'denite#do_map("do_action", "preview")',nil)
end

return M
