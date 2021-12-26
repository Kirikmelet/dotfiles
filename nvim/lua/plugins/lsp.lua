local vim = vim

require('func.packadder').packadd({
   'nvim-lspconfig';
   'lsp_extensions.nvim';
   'lspsaga.nvim';
   'nvim-cmp';
   'cmp-nvim-lsp',
   'LuaSnip',
   'cmp_luasnip',
})

local lspuse = require('lspconfig')
local sumnekopath = os.getenv('HOME')..'/.local/opt/lua-language-server/'
local cmp_nvim = require('cmp_nvim_lsp')

--{{{Completions
local cmp = require'cmp'
cmp.setup {
   snippet = {
      expand = function(args)
         require('luasnip').lsp_expand(args.body)
      end,
   },
  mapping = {
     ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
     ['<CR>'] = cmp.mapping.confirm({select=true})
  };
  sources = cmp.config.sources({
     {name = 'nvim_lsp'},
     {name = 'orgmode'},
     {name = 'luasnip'}
  },
  {
     name = 'buffer'
  }
  )
}

cmp.setup.cmdline('/', {
   sources = {
      {name = 'buffer'}
   }
})
cmp.setup.cmdline(':', {
   sources = cmp.config.sources({
      { name = 'path' }
   }, {
      { name = 'cmdline' }
   })
})


--vim.g.completion_matching_strategy_list = {'exact','substring','fuzzy'}
--vim.g.completion_auto_change_source = 1
--vim.g.completion_trigger_on_delete = 1
--
--vim.g.completions_chain_complete_list = {
--   default = {
--      default = {
--         {complete_items = {'lsp', 'snippet', 'path'}};
--         {mode = 'file'};
--      },
--      comment = {},
--      string = {}
--   },
--   vim = {
--      {complete_items = {'snippet', 'path'}},
--      {mode = 'cmd'}
--   },
--   c = {
--      {complete_items = {'ts', 'lsp', 'path', 'snippet'}},
--   },
--   python = {
--      {complete_items = {'ts', 'lsp', 'path', 'snippet'}},
--   },
--   lua = {
--      {complete_items = {'ts', 'lsp', 'path'}},
--   },
--   javascript = {
--      {complete_items = {'ts', 'lsp', 'path', 'snippet'}},
--   },
--   typescript = {
--      {complete_items = {'ts', 'lsp', 'path', 'snippet'}},
--   },
--
--}

vim.o.shortmess = vim.o.shortmess..'c'
--}}}



local capabilities = cmp_nvim.update_capabilities(vim.lsp.protocol.make_client_capabilities())
--capabilities.textDocument.completion.completionItem.snippetSupport = true
--

--{{{Setups
lspuse.cssls.setup{capabilities=capabilities}
lspuse.clangd.setup{capabilities=capabilities}
lspuse.pylsp.setup{capabilities=capabilities}
lspuse.html.setup{capabilities=capabilities}
lspuse.tsserver.setup{capabilities=capabilities}
lspuse.jdtls.setup{
   capabilities=capabilities,
   cmd = {'jdtls'},
   root_dir = function(fname)
      return lspuse.util.root_pattern('pom.xml', 'gradle.build', '.git')(fname)
      or vim.fn.getcwd()
   end
}
--lspuse.rls.setup{on_attach=on_attach_vim}
lspuse.sumneko_lua.setup{
   cmd = {sumnekopath..'bin/Linux/lua-language-server', '-E', sumnekopath..'main.lua'};
   settings = {
      Lua = {
         diagnostics = {
            globals = { 'vim' }
         }
      }
   },
capabilities=capabilities
}
--}}}

--{{{Handles
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
--}}}

--{{{Bindings
--}}}


-- Quickfix Buffer
