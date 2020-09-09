local api = vim.api

return function(mode, key, cmd, opts)
	if opts == nil then
		opts  = {silent = true, noremap = true}
	end
	api.nvim_set_keymap(mode, key, cmd, opts)
end
