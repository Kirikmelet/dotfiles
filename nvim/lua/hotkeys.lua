local vim = vim
local api = vim.api
local binder = require('func/binder')

--{{{Autopair
local autopair = {
      {'i', '(', '()<Esc>hli',nil,nil};
      {'i', '[', '[]<Esc>hli',nil,nil};
      {'i', '{', '{}<Esc>hli',nil,nil};
}
--}}}
binder(autopair)

--{{{Splits
local splits = {
      {'n', '<leader>sv', '<cmd>vsplit<CR>', {silent = false, noremap = false},nil};
      {'n', '<leader>sh', '<cmd>split<CR>', {silent = false, noremap = false},nil};
}
--}}}
binder(splits)

--{{{Tabs
local tabs = {
      {'n', '<leader>tn', '<cmd>tabnew<CR>', {silent = false, noremap = false},nil};
      {'n', '<leader>tc', '<cmd>tabclose', {silent = false, noremap = false},nil};
}
--}}}
binder(tabs)

--{{{Completion-nvim /Diagnostic-nvimm
api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], {expr = true, noremap = true})
api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {expr = true, noremap = true})
--}}}

--{{{Terminal
local termkeys = {
      {'t', '<C-x><C-c>', '<C-\\><C-n>',nil,nil};
}
--}}}
binder(termkeys)

--{{{ File Hotkeys
local appkeys = {
   {'n', '<leader>fs', '<cmd>lua require("telescope.builtin").live_grep()<CR>',nil,nil};
   {'n', '<leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>',nil,nil};
   {'n', '<leader>fm', '<cmd>make<CR>',nil,nil};
   {'n', '<leader>fts', '<cmd>lua require("telescope.builtin").treesitter()<CR>',nil,nil};
   {'n', '<leader>ftg', '<cmd>!ctags %<CR>',nil,nil};
}
--}}}
binder(appkeys)

--{{{Buffer hotkeys
local bufkeys = {
   {'n', '<leader>bf', '<cmd>lua require("telescope.builtin").find_files()<CR>',nil,nil};
   {'n', '<leader>bd', '<cmd>Defx -buffer-name=bar<CR>',nil,nil};
   {'n', '<leader>bb', '<cmd>lua require("telescope.builtin").buffers()<CR>',nil,nil};
   {'n', '<leader>bso', 'zo',nil,nil};
   {'n', '<leader>bsc', 'zc',nil,nil};
   {'n', '<leader>bst', 'za',nil,nil};
   {'n', '<leader>bsC', 'zM',nil,nil};
   {'n', '<leader>bsO', 'zR',nil,nil};
   {'n', '<leader>bss', '<cmd>mksession!<CR>',nil,nil};
   {'n', '<leader>bso', '<cmd>source Session.vim<CR>',nil,nil};
}
--}}}
binder(bufkeys)

--{{{Application hotkeys
local apphotkeys = {
   {'n', '<leader>aw', '<cmd>Defx -buffer-name=defxplore ~/vimwiki<CR>',nil,nil};
   {'n', '<leader>ao', '<cmd>Defx -buffer-name=defxplore ~/org<CR>',nil,nil};
   {'n', '<leader>ad', '<cmd>Defx -buffer-name=defxploreCR>',nil,nil};
}
--}}}
binder(apphotkeys)

--{{{Git hotkeys
local gitkeys = {
   {'n', '<leader>gc', '<cmd>Git commit<CR>',nil};
   {'n', '<leader>gg', '<cmd>G<CR>',nil};
   {'n', '<leader>gps', '<cmd>split | term git push<CR>',nil};
   {'n', '<leader>gpl', '<cmd>Git pull<CR>',nil,nil};
   {'n', '<leader>gf', '<cmd>Git fetch<CR>',nil,nil};
}
--}}}
binder(gitkeys)

--{{{REPL hotkeys
local ironkeys = {
   {'n', '<leader>ro', '<cmd>IronRepl<CR>',nil};
   {'n', '<leader>rf', '<cmd>IronFocus<CR>',nil}
}
--}}}
binder(ironkeys)

--{{{Debug
local debugkeys = {
      {'n', '<leader>pl', '<cmd>lua require"git".load()<CR>',nil,nil}
}
--}}}
binder(debugkeys)
