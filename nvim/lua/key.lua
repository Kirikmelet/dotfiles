local vim = vim
local api = vim.api
local binder = require('func/binder')

-- Autopair
local autopair = {
      {'i', '(', '()<Esc>hli',nil,nil};
      {'i', '[', '[]<Esc>hli',nil,nil};
      {'i', '{', '{}<Esc>hli',nil,nil};
}
binder(autopair)

-- Splits
local splits = {
      {'n', '<leader>sv', '<cmd>vsplit<CR>', {silent = false, noremap = false},nil};
      {'n', '<leader>sh', '<cmd>split<CR>', {silent = false, noremap = false},nil};
}
binder(splits)

-- Tabs
local tabs = {
      {'n', '<leader>tn', '<cmd>tabnew<CR>', {silent = false, noremap = false},nil};
      {'n', '<leader>tc', '<cmd>tabclose', {silent = false, noremap = false},nil};
}
binder(tabs)

-- Completion-nvim /Diagnostic-nvimm
--binder('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
--binder('i', '<S-Tab>', [[pumvisible() ? "<C-p>" : "<S-Tab>"]], {expr = true, noremap=true}) -- These don't work
api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], {expr = true, noremap = true})
api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {expr = true, noremap = true})

-- Terminal
local termkeys = {
      {'t', '<C-x><C-c>', '<C-\\><C-n>',nil,nil};
}
binder(termkeys)
