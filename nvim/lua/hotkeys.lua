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
api.nvim_set_keymap('i', '<c-space>', [[<Plug>(completion_trigger)]], {expr = false, silent = true, noremap = false})
--}}}

--{{{Terminal
local termkeys = {
      {'t', '<C-x><C-c>', '<C-\\><C-n>',nil,nil};
}
--}}}
binder(termkeys)

--{{{ File Hotkeys
local filekeys = {
   {'n', '<leader>fs', ':execute "grep ".input("Search Text: ")." %"<CR>', nil, nil};
   {'n', '<leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>',nil,nil};
   {'n', '<leader>fm', '<cmd>make<CR>',nil,nil};
   {'n', '<leader>ftg', '<cmd>!ctags %<CR>',nil,nil};
}
--}}}
binder(filekeys)

--{{{Buffer hotkeys
local bufkeys = {
   {'n', '<leader>bso', 'zo',nil,nil};
   {'n', '<leader>bsc', 'zc',nil,nil};
   {'n', '<leader>bst', 'za',nil,nil};
   {'n', '<leader>bsC', 'zM',nil,nil};
   {'n', '<leader>bsO', 'zR',nil,nil};
   {'n', '<leader>bss', '<cmd>mksession!<CR>',nil,nil};
   {'n', '<leader>bso', '<cmd>source Session.vim<CR>',nil,nil};
   {'n', '<leader>bqo', '<cmd>copen<CR>',nil, nil};
   {'n', '<leader>bqn', '<cmd>cnext<CR>',nil, nil};
   {'n', '<leader>bqb', '<cmd>cprev<CR>',nil, nil};
   {'n', '<leader>bqc', '<cmd>cc<CR>',nil, nil};
   {'n', '<leader>bqf', '<cmd>cfirst<CR>',nil, nil};
   {'n', '<leader>bql', '<cmd>clast<CR>',nil, nil};
}
--}}}
binder(bufkeys)

--{{{Application hotkeys
local apphotkeys = {
   {'n', '<leader>aw', '<cmd>Explore ~/vimwiki<CR>',nil,nil};
   {'n', '<leader>ao', '<cmd>Explore ~/org<CR>',nil,nil};
   {'n', '<leader>ad', '<cmd>Explore<CR>',nil,nil};
   {'n', '<leader>at', '<cmd>term<CR>',nil,nil};
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

--{{{Debug
local debugkeys = {
      {'n', '<leader>pl', '<cmd>lua require"git".load()<CR>',nil,nil};
}
--}}}
binder(debugkeys)

