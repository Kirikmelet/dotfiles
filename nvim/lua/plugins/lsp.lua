local vim = vim
local plugman = require('func/packadder')

plugman.packadd({
   'nvim-lspconfig';
   'lsp_extensions.nvim';
   'lspsaga.nvim'})

local lspuse = require('lspconfig')
local binder = require('../func/binder')

local sumnekopath = os.getenv('HOME')..'/.local/opt/lua-language-server/'

local on_attach_vim = function()
	require'completion'.on_attach()
end
lspuse.clangd.setup{on_attach=on_attach_vim}
lspuse.pyls.setup{on_attach=on_attach_vim}
lspuse.html.setup{on_attach=on_attach_vim}
lspuse.tsserver.setup{on_attach=on_attach_vim}
lspuse.rls.setup{on_attach=on_attach_vim}
lspuse.sumneko_lua.setup{
   on_attach=on_attach_vim;
   cmd = {sumnekopath..'bin/Linux/lua-language-server', '-E', sumnekopath..'main.lua'};
   settings = {
      Lua = {
         diagnostics = {
            globals = { 'vim' }
         }
      }
   }
}

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- This will disable virtual text, like doing:
    -- let g:diagnostic_enable_virtual_text = 0
    virtual_text = {
       spacing = 4,
    },

    -- This is similar to:
    -- let g:diagnostic_show_sign = 1
    -- To configure sign display,
    --  see: ":help vim.lsp.diagnostic.set_signs()"
    signs = true,

    -- This is similar to:
    -- "let g:diagnostic_insert_delay = 1"
    update_in_insert = false,
  }
)

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
