local vim = vim
local api = vim.api
local plugman = require('func/packadder')

plugman.packadd({
   'nvim-lspconfig',
   'lsp_extensions.nvim',
   })




local lspuse = require'nvim_lsp'
local binder = require('../func/binder')

local on_attach_vim = function()
	require'completion'.on_attach()
	require'diagnostic'.on_attach()
end
--lspuse.clangd.setup{on_attach=on_attach_vim}
--lspuse.pyls.setup{on_attach=on_attach_vim}
--lspuse.html.setup{on_attach=on_attach_vim}
--lspuse.sumneko_lua.setup{on_attach=on_attach_vim}


--{{{Bindings
local lspbinds = {
      {'n', '<leader>lge', '<cmd>lua vim.lsp.buf.declaration()<CR>',nil,nil};
      {'n', '<leader>lgd', '<cmd>lua vim.lsp.buf.definition()<CR>',nil,nil};
      {'n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>',nil,nil};
      {'n', '<leader>lgD', '<cmd>lua vim.lsp.buf.implementation()<CR>',nil,nil};
      {'n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>',nil,nil};
      {'n', '<leader>ltd', '<cmd>lua vim.lsp.buf.type_definition()<CR>',nil,nil};
      {'n', '<leader>lgr', '<cmd>lua vim.lsp.buf.references()<CR>',nil,nil};
      {'n', '<leader>lff', '<cmd>lua vim.lsp.buf.document_symbol()<CR>',nil,nil};
      {'n', '<leader>lgW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>',nil,nil};
}
binder(lspbinds)
--}}}
