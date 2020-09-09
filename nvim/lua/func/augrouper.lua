local vim = vim
local api = vim.api

local function nvim_autgrouper(defi)
	for group_name, defis in pairs(defi) do
		api.nvim_command('augroup '..group_name)
		api.nvim_command('autocmd!')
		for _, def in ipairs(defis) do
			local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
			api.nvim_command(command)
		end
		api.nvim_command('augroup END')
	end
end

return {
	nvim_autgrouper = nvim_autgrouper,
}
