vim = vim
api = vim.api
local binder = require('func/binder')

-- Autopair
binder('i', '(', '()<Esc>hli',nil)
binder('i', '[', '[]<Esc>hli',nil)
binder('i', '{', '{}<Esc>hli',nil)


-- Splits
binder('n', '<leader>sv', '<cmd>vsplit<CR>', {silent = false, noremap = false})
binder('n', '<leader>sh', '<cmd>split<CR>', {silent = false, noremap = false})

-- Tabs
binder('n', '<leader>tn', '<cmd>tabnew<CR>', {silent = false, noremap = false})
binder('n', '<leader>tc', '<cmd>tabclose', {silent = false, noremap = false})

-- Completion-nvim /Diagnostic-nvimm
--binder('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
--binder('i', '<S-Tab>', [[pumvisible() ? "<C-p>" : "<S-Tab>"]], {expr = true, noremap=true}) -- These don't work
api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], {expr = true, noremap = true})
api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {expr = true, noremap = true})

-- Terminal
binder('t', '<C-x><C-c>', '<C-\\><C-n>',nil)
