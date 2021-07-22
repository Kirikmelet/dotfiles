local vim = vim

require('func.packadder').packadd({
   'nvim-lspconfig';
   'lsp_extensions.nvim';
   'lspsaga.nvim'
})

local lspuse = require('lspconfig')

local sumnekopath = os.getenv('HOME')..'/.local/opt/lua-language-server/'

local on_attach_vim = function()
   --require'completion'.on_attach()
end
lspuse.clangd.setup{on_attach=on_attach_vim}
lspuse.pylsp.setup{on_attach=on_attach_vim}
--lspuse.html.setup{on_attach=on_attach_vim}
--lspuse.tsserver.setup{on_attach=on_attach_vim}
--lspuse.rls.setup{on_attach=on_attach_vim}
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
--}}}

-- Quickfix Buffer
