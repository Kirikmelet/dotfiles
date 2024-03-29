local vim = vim
local neogit = require('neogit')

require('func.packadder').packadd({'which-key.nvim'})


local w = require('which-key')
local lsp_buf = vim.lsp.buf
local telescope = require('telescope.builtin')


w.setup()

w.register({
  t = {
     name = 'tabs';
     n = {function() vim.cmd[[tabnew]]end, noremap=false, 'New tab'};
     c = {'<cmd>tabclose', noremap=false, 'Close tab (PROMPT)'}
  };
  f = {
     name='files';
     f = {function() vim.lsp.buf.formatting() end, 'Format file'};
     m = {function() vim.cmd[[make]] end, 'Make project'};
     t = {function() vim.cmd[[!ctags %]] end, 'Generate ctags'};
     s = {function() telescope.live_grep() end, 'Search for string'}
  };
  b = {
     name = 'buffer';
     s = {
        name = 'folds';
        o = {'zo', 'Open fold'};
        c = {'zc', 'Close fold'};
        t = {'za', 'Toggle fold'};
        C = {'cM', 'Close ALL folds'};
        O = {'cO', 'Open ALL folds'};
     };
     w = {
        name = 'session | workplace';
        s = {function() vim.cmd[[mksession!]] end, 'Make new session'};
        o = {function() vim.cmd[[source Session.vim]] end, 'Open session file'};
     };
     ['<leader>'] = {function() vim.cmd[[copen]] end, 'Open quickfix/loclist buffer'};
     f = {function() telescope.find_files() end, 'Find file'};
     b = {function() telescope.buffers() end, 'Find buffer'};
  };
  a = {
     name ='apps';
     o = {function() vim.cmd[[edit ~/org]] end, 'Open org dir'};
     d = {function() vim.cmd[[edit .]] end, 'Open (n)vim file explorer'};
     --s = {function() vim.cmd[[edit . | bel res -10]] end , 'Open (n)vim file explorer horizontally'};
     --v = {function() vim.cmd[[edit . | vert res 30]] end , 'Open (n)vim file explorer vertically'};
     t = {function() vim.cmd[[term]] end, 'Open terminal'};
     g = {
        name = 'git';
        c = {function() neogit.open({'commit'}) end, 'Git commit'};
        g = {function() neogit.open() end, 'Git'};
        p = {function() neogit.open({"push"}) end, 'Git push'};
        P = {function() neogit.open({"pull"}) end, 'Git pull'};
     }
  };
  o = {
     name = 'org';
     o = {'Open org agenda'};
     a = {'Open org capture'};
  };
  l = {
     name = 'lsp';
     a = {function() require('lspsaga.codeaction').code_action() end, 'Get code actions'};
     f = {function() require('lspsaga.provider').lsp_finder() end, 'Find from LSP'};
     e = {function() lsp_buf.declaration() end, 'Get declaration under cursor'};
     d = {function() lsp_buf.definition() end, 'Get definition under cursor'};
     h = {function() lsp_buf.hover() end, 'Hover LSP over cursor'};
     i = {function() lsp_buf.implementation() end, 'Get implementation under cursor'};
     t = {function() lsp_buf.type_definition() end, 'Get type definition under cursor'};
     r = {function() lsp_buf.references() end, 'Get reference under cursor'};
     p = {
        function() require('lspaga.provider').preview_definition() end,
        'Preview definition'
     };
     q = {function() vim.lsp.diagnostic.set_loclist() end, 'Get issues'};
     s = {function() vim.lsp.buf.signature_help() end, 'Get signature help'};
  }

}, {prefix = '<leader>'})

w.register({
   ['<C-x><C-c>'] = {'Go to terminal-normal mode'};
}, {mode='t'})
