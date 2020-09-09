local vim = vim
local api = vim.api



local statusline = {
	'%#PmenuSel#';
	'%{toupper(mode())}%m';
	'%r%h%w%q%#LineNr#';
	'%<%F%=%#StatusLineNC#';
	'%y';
	'%<%{&fileencoding?&fileencoding:&encoding}|%{&fileformat}';
	'%#WildMenu#';
	'%l.%c - %<L:%L ';
}
statusline = table.concat(vim.tbl_flatten(statusline), ' ')
api.nvim_set_option('statusline', statusline)
