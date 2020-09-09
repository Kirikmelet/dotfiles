local vim = vim
local api = vim.api

--local runpath = api.nvim_get_option('runtimepath')..', /home/troyd/.local/share/nvim/site/pack/packer/start/nvim-lspconfig'
--api.nvim_set_option('runtimepath',runpath)


local lspuse = require'nvim_lsp'
local binder = require('../func/binder')

local on_attach_vim = function()
	require'completion'.on_attach()
	require'diagnostic'.on_attach()
end
lspuse.clangd.setup{on_attach=on_attach_vim}
lspuse.pyls.setup{on_attach=on_attach_vim}
lspuse.html.setup{on_attach=on_attach_vim}
lspuse.sumneko_lua.setup{on_attach=on_attach_vim}

--{{{Bindings
binder('n', '<leader>lge', '<cmd>lua vim.lsp.buf.declaration()<CR>',nil)
binder('n', '<leader>lgd', '<cmd>lua vim.lsp.buf.definition()<CR>',nil)
binder('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>',nil)
binder('n', '<leader>lgD', '<cmd>lua vim.lsp.buf.implementation()<CR>',nil)
binder('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>',nil)
binder('n', '<leader>ltd', '<cmd>lua vim.lsp.buf.type_definition()<CR>',nil)
binder('n', '<leader>lgr', '<cmd>lua vim.lsp.buf.references()<CR>',nil)
binder('n', '<leader>lff', '<cmd>lua vim.lsp.buf.document_symbol()<CR>',nil)
binder('n', '<leader>lgW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>',nil)
--}}}
