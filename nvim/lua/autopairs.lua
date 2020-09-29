local vim = vim
local api = vim.api
local aug = require('func/augrouper')


aug({
	remember_folds = {
		{'BufWinLeave', '*', 'mkview'};
		{'BufWinEnter', '*', 'silent! loadview'};
	};
	denite_start = {
		{'FileType', 'denite', 'lua require("plugins/denite")._bind()'};
	};
	defx_start = {
		{'FileType', 'defx', 'lua require("plugins/defx")._bind()'};
		{'BufEnter', '*', 'if isdirectory(@%) | cd %:p | Defx -buffer-name=defxplore | endif'};
	};
	lua_highLight = {
		{'TextYankPost', '*', 'silent! lua require"vim.highlight".on_yank()'};
	};
   lsp_diag = {
      {'CursorHold', '*', 'lua vim.lsp.util.show_line_diagnostics()'};
--      {'CursorHold', '*', 'lua vim.lsp.buf.hover()'};
      {'CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost', '*.rs', 'lua require"lsp_extensions".inlay_hints{prefix = "", highlight = "Comment"}'};
   };
	lsptreeload = {
		{'FileType', 'c,html,lua,javascript,python,', 'lua require"plugins/lsp"'};
	}

})




