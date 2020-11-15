local vim = vim
local aug = require('func/augrouper')

aug({
	lua_highLight = {
		{'TextYankPost', '*', 'silent! lua require"vim.highlight".on_yank()'};
	};
   lsp_diag = {
      {'CursorHold', '*', 'lua vim.lsp.diagnostic.show_line_diagnostics()'};
      --{'CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost', '*.rs', 'lua require"lsp_extensions".inlay_hints{prefix = "", highlight = "Comment"}'};
   };
})
