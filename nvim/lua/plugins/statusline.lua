local vim = vim

require('func.packadder').packadd{'lualine.nvim'}

--vim.o.statusline = table.concat({
--	'%#PmenuSel#';
--	'0x%B%m';
--	'%r%h%w%q%<%#LineNr#';
--	'%<%F%=%#StatusLineNC#';
--	'%y';
--	'%<%{&fileencoding?&fileencoding:&encoding}|%{&fileformat}';
--	'%#WildMenu#';
--	'%l.%c - %<L:%L ';
--}, ' ')


require('lualine').setup{options = {theme='auto'}}
