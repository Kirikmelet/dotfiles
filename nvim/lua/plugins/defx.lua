local vim = vim
local api = vim.api
local M = {}


local function bufbind(buf, mode, key, cmd, opts)
	if opts == nil then
		opts = {expr = true, noremap = true, silent = true}
	end
	api.nvim_buf_set_keymap(buf, mode, key, cmd, opts)
end


vim.fn['defx#custom#column']('icon', {
		directory_icon = 'Dir';
		opened_icon = 'Opn';
		root_icon = 'R'
	})

vim.fn['defx#custom#column']('git', {
		indicators = {
			Modified = 'Gm!';
			Staged = 'GS!';
			Untracked = ' ';
			Renamed = 'GR!';
			Ignored = 'GI!';
			Deleted = 'GD!';
			Unknown = 'G??'
		}
	})
vim.fn['defx#custom#option']('bar',
	{
		split = 'vertical';
		winwidth = 30;
		show_ignored_files = 1;
		buffer_name = 'defxbar';
		toggle = 1;
		resume = 1;
		direction = 'topleft';
		ignored_files = '.git,.clangd';
		root_marker = ''
	})
vim.fn['defx#custom#option']('defxplore',
	{
		columns = 'indent:icon:filename:size:type:git';
		toggle = 1;
		buffer_name = 'defxplore';
	})

function M._on_ft_defx_bind()
	local buf = api.nvim_get_current_buf()
	vim.wo.signcolumn = 'no'
	api.nvim_buf_set_option(buf,'expandtab',false)

	bufbind(buf, 'n', '<CR>', 'defx#do_action("drop")',nil)
	bufbind(buf, 'n', 'c', 'defx#do_action("copy")',nil)
	bufbind(buf, 'n', 'u', 'defx#do_action("cd", [".."])',nil)
	bufbind(buf, 'n', 'd', 'defx#do_action("remove")',nil)
	bufbind(buf, 'n', 'm', 'defx#do_action("move")',nil)
	bufbind(buf, 'n', 'i', 'defx#do_action("open", "vsplit")',nil)
	bufbind(buf, 'n', 'v', 'defx#do_action("open", "split")',nil)
	bufbind(buf, 'n', 't', 'defx#do_action("open", "tabnew")',nil)
	bufbind(buf, 'n', 'o', 'defx#do_action("open")',nil)
	bufbind(buf, 'n', 'q', 'defx#do_action("quit")',nil)
	bufbind(buf, 'n', 's', 'defx#do_action("save_session")',nil)
	bufbind(buf, 'n', 'r', 'defx#do_action("rename")',nil)
	bufbind(buf, 'n', 'p', 'defx#do_action("paste")',nil)
	bufbind(buf, 'n', 'E', 'defx#do_action("execute_system")',nil)
	bufbind(buf, 'n', 'y', 'defx#do_action("yank_path")',nil)
	bufbind(buf, 'n', 'nf', 'defx#do_action("new_file")',nil)
	bufbind(buf, 'n', 'nd', 'defx#do_action("new_directory")',nil)
	bufbind(buf, 'n', 'nF', 'defx#do_action("new_miltiple_files")',nil)
end

return M
