local vim = vim

vim.o.statusline = table.concat({
	'%#PmenuSel#';
	'0x%B%m';
	'%r%h%w%q%<%#LineNr#';
	'%<%F%=%#StatusLineNC#';
	'%y';
	'%<%{&fileencoding?&fileencoding:&encoding}|%{&fileformat}';
	'%#WildMenu#';
	'%l.%c - %<L:%L ';
}, ' ')
