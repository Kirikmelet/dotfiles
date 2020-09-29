local vim = vim
local api = api
local M = {}

function M.call_defx()
	local defx = require('plugins/defx')
	defx._on_ft_defx_bind()
end

return M
