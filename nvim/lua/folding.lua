local vim = vim
local api = vim.api
local aug = require('func/augrouper')


local autocmds = {
	remember_folds = {
		{'BufWinLeave', '*', 'mkview'};
		{'BufWinEnter', '*', 'silent! loadview'};
	};
	deniteStart = {
		{'FileType', 'denite', 'lua require("plugins/denite")._on_ft_denite_bind()'};
	};
	denitefunc = {
		{'BufEnter', '*', 'call denite#do_map("quit")'};
	};
	LuaHighLight = {
		{'TextYankPost', '*', 'silent! lua require"vim.highlight".on_yank()'};
	};
	defxStart = {
		{'FileType', 'defx', 'lua require("plugins/defx")._on_ft_defx_bind()'};
	};
	checkdefx = {
		{'WinEnter', '*', 'if &filetype == "defx" && winnr("$") == 1| bdel | endif'};
		{'TabLeave', '*', 'if &filetype == "defx" | wndcmd w | endif'};
		{'BufEnter', '*', 'call defx#do_action("quit")'};
	};
   vimenter = {
      {'BufEnter', '*', 'if isdirectory(@%) | cd %:p | Defx -buffer-name=defxplore | endif'};
   };
   lsp_diag = {
      {'CursorHold', '*', 'lua vim.lsp.util.show_line_diagnostics()'};
--      {'CursorHold', '*', 'lua vim.lsp.buf.hover()'};
      {'CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost', '*.rs', 'lua require"lsp_extensions".inlay_hints{prefix = "", highlight = "Comment"}'};
   }

}

aug.nvim_autgrouper(autocmds)


